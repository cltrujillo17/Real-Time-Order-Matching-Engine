#include "order_book.hpp"
#include <thread>
#include <chrono>

int main() {
    OrderBook book;

    Order order1(1, Side::BUY, OrderType::LIMIT, 101.0, 100, time(nullptr), "TEST");
    Order order2(2, Side::SELL, OrderType::LIMIT, 100.5, 100, time(nullptr), "TEST");

    book.addOrder(order1);
    book.addOrder(order2);

    book.matchOrders();
    book.printBook();

    return 0;
}
