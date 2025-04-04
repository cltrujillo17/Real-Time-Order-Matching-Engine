#ifndef ORDER_BOOK_HPP
#define ORDER_BOOK_HPP

#include "order.hpp"
#include <map>
#include <queue>
#include <mutex>

class OrderBook {
public:
    void addOrder(const Order& order);
    void matchOrders();
    void printBook();  // For debugging

    const std::map<double, std::queue<Order>>& getBuyOrders() const { return buyOrders; }
    const std::map<double, std::queue<Order>>& getSellOrders() const { return sellOrders; }


private:
    std::map<double, std::queue<Order>> buyOrders;   // Key: price, descending
    std::map<double, std::queue<Order>> sellOrders;  // Key: price, ascending

    
    std::mutex bookMutex;

    void execute(Order& buy, Order& sell);
};

#endif
