cmake_minimum_required(VERSION 3.10)
project(MatchingEngine)

set(CMAKE_CXX_STANDARD 17)

include_directories(include)

# CLI executable for testing the matching logic
add_executable(cli_test
    src/main.cpp
    src/order_book.cpp
)

# TCP server to receive Python client orders
add_executable(matching_server
    src/server.cpp
    src/order_book.cpp
)
