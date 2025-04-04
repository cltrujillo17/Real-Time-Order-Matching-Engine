#include <iostream>
#include <string>
#include <thread>
#include <vector>
#include <netinet/in.h>
#include <unistd.h>
#include <cstring>
#include <sstream>
#include "json.hpp"     
#include "order_book.hpp"      

using json = nlohmann::json;
OrderBook orderBook;

void handleClient(int clientSocket) {

    char buffer[1024];
    memset(buffer, 0, sizeof(buffer));
    read(clientSocket, buffer, sizeof(buffer));


    std::string input(buffer);
    input.erase(std::remove_if(input.begin(), input.end(), ::isspace), input.end());

    if (input == "GET_BOOK") {
        std::ostringstream oss;
        oss << "{ \"buy\": [";

        bool first = true;
        for (auto it = orderBook.getBuyOrders().rbegin(); it != orderBook.getBuyOrders().rend(); ++it) {
            if (!first) oss << ",";

            int totalQty = 0;
            std::queue<Order> q = it->second;
            while (!q.empty()) {
                totalQty += q.front().quantity;
                q.pop();
            }
            oss << "{ \"price\": " << it->first << ", \"quantity\": " << totalQty << ", \"ticker\": \"" << q.front().ticker << "\" }";

            first = false;
        }
        oss << "], \"sell\": [";

        first = true;
        for (const auto& it : orderBook.getSellOrders()) {
            if (!first) oss << ",";
            int totalQty = 0;
            std::queue<Order> q = it.second;
            while (!q.empty()) {
                totalQty += q.front().quantity;
                q.pop();
            }
            oss << "{ \"price\": " << it.first << ", \"quantity\": " << totalQty << ", \"ticker\": \"" << q.front().ticker << "\" }";

            first = false;
        }
        oss << "] }";

        std::string bookJson = oss.str();
        send(clientSocket, bookJson.c_str(), bookJson.size(), 0);
        close(clientSocket);
        return;
    }


    try {
        
        json j = json::parse(buffer);

        int id = j["order_id"];
        std::string sideStr = j["side"];
        std::string typeStr = j["type"];
        double price = j["price"];
        int quantity = j["quantity"];
        long timestamp = j["timestamp"];
        std::string ticker = j.value("ticker", "");

        Side side = (sideStr == "buy") ? Side::BUY : Side::SELL;
        OrderType type = (typeStr == "limit") ? OrderType::LIMIT : OrderType::MARKET;

        Order order(id, side, type, price, quantity, timestamp, ticker);
        orderBook.addOrder(order);
        orderBook.matchOrders();

        std::ostringstream oss;
        oss << "Order " << id << " processed.\n";
        send(clientSocket, oss.str().c_str(), oss.str().size(), 0);
    } catch (const std::exception& e) {
        std::string error = std::string("Error: ") + e.what();
        send(clientSocket, error.c_str(), error.size(), 0);
    }

    close(clientSocket);
}

int main() {
    int server_fd, new_socket;
    sockaddr_in address;
    int opt = 1;
    int addrlen = sizeof(address);
    const int PORT = 9999;

    server_fd = socket(AF_INET, SOCK_STREAM, 0);
    setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &opt, sizeof(opt));

    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(PORT);

    bind(server_fd, (struct sockaddr*)&address, sizeof(address));
    listen(server_fd, 5);

    std::cout << "Server listening on port " << PORT << "...\n";

    while (true) {
        new_socket = accept(server_fd, (struct sockaddr*)&address, (socklen_t*)&addrlen);
        std::thread t(handleClient, new_socket);
        t.detach(); // Handle each client in a separate thread
    }

    close(server_fd);
    return 0;
}
