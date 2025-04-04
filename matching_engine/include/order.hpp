#ifndef ORDER_HPP
#define ORDER_HPP

#include <string>

enum class OrderType { MARKET, LIMIT };
enum class Side { BUY, SELL };

struct Order {
    int id;
    Side side;
    OrderType type;
    double price;
    int quantity;
    long timestamp;
    std::string ticker;  

    Order(int i, Side s, OrderType t, double p, int q, long ts, const std::string& tk)
        : id(i), side(s), type(t), price(p), quantity(q), timestamp(ts), ticker(tk) {}
    
};

#endif
