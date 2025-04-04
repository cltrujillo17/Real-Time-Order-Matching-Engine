import socket
import json
import time

def send_order(host='localhost', port=9999):
    # Define an order
    order = {
        "order_id": 1001,
        "side": "buy",
        "type": "limit",
        "price": 101.50,
        "quantity": 50,
        "timestamp": int(time.time())
    }

    # Serialize to JSON
    message = json.dumps(order).encode('utf-8')

    # Connect to the matching engine server
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect((host, port))
        s.sendall(message)

        # Optional: receive server response
        response = s.recv(1024)
        print("Response from server:", response.decode())

if __name__ == "__main__":
    send_order()
