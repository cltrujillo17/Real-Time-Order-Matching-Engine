#include "order_book.hpp"
#include <iostream>

void OrderBook::addOrder(const Order& order) {
    std::lock_guard<std::mutex> lock(bookMutex);
    if (order.side == Side::BUY) {
        buyOrders[order.price].push(order);
    } else {
        sellOrders[order.price].push(order);
    }
}

void OrderBook::matchOrders() {
    std::lock_guard<std::mutex> lock(bookMutex);

    while (!buyOrders.empty() && !sellOrders.empty()) {
        auto buyIt = buyOrders.rbegin();
        auto sellIt = sellOrders.begin();

        if (buyIt->first >= sellIt->first) {
            Order buy = buyIt->second.front();
            Order sell = sellIt->second.front();
            execute(buy, sell);

            buyIt->second.pop();
            sellIt->second.pop();
            if (buyIt->second.empty()) buyOrders.erase(buyIt->first);
            if (sellIt->second.empty()) sellOrders.erase(sellIt->first);
        } else {
            break;
        }
    }
}

void OrderBook::execute(Order& buy, Order& sell) {
    int executedQty = std::min(buy.quantity, sell.quantity);
    std::cout << "Executed " << executedQty << " @ " << sell.price
              << " between BUY #" << buy.id << " and SELL #" << sell.id << std::endl;
}

void OrderBook::printBook() {
    std::cout << "--- BUY SIDE ---\n";
    for (auto it = buyOrders.rbegin(); it != buyOrders.rend(); ++it) {
        std::cout << it->first << ": " << it->second.size() << " orders\n";
    }
    std::cout << "--- SELL SIDE ---\n";
    for (const auto& it : sellOrders) {
        std::cout << it.first << ": " << it.second.size() << " orders\n";
    }
}
