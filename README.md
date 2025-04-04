# 📈 Real-Time Order Matching Engine

A real-time trading simulator featuring an interactive web-based GUI built with Streamlit and a high-performance backend powered by C++. This project simulates real-world stock trading using live market data and provides visual analytics through dynamic charts and portfolio tracking.

---

## 🚀 Features

- **Real-Time Order Matching:** Limit orders processed and matched in real-time.
- **Interactive Web GUI:** Built with Streamlit for real-time interaction.
- **Live Market Data:** Integrated with Yahoo Finance (via `yfinance`) to fetch live stock data.
- **Candlestick Charts:** Real-time visualization of recent stock price history.
- **Portfolio Tracking:** Tracks wallet balance, total spent/earned, and a comprehensive transaction log.
- **Wallet Management:** Deposit and withdraw virtual money in your trading account.

---

## 🛠 Tech Stack

### Frontend
- **Streamlit:** Interactive web-based UI.
- **Plotly:** Real-time interactive candlestick charts.
- **yfinance:** Fetching real-time stock market data.

### Backend
- **C++:** High-performance matching engine.
- **Sockets:** TCP/IP socket communication for real-time interaction.
- **JSON:** Structured data exchange format between the frontend and backend.

---

## ⚙️ Installation and Running

### Backend Setup (C++ Matching Engine)

```bash
cd matching_engine
mkdir build && cd build
cmake ..
make
./matching_server
```

### Frontend Setup (Streamlit GUI)

```bash
cd matching_engine/gui
pip install streamlit plotly yfinance pandas
streamlit run gui.py
```

---

## 📌 Usage

- **Place Orders:** Choose buy/sell side, stock ticker, and quantity.
- **View Transactions:** Check your transaction log for all submitted trades.
- **Wallet Management:** Deposit or withdraw cash using the wallet feature.

---

## 📷 Screenshots
![Screenshot 2025-04-04 at 6 00 02 PM](https://github.com/user-attachments/assets/ca81be8e-177b-46b4-b9d5-ace8b48e5f3b)
![Screenshot 2025-04-04 at 6 00 02 PM](https://github.com/user-attachments/assets/1216138c-c156-4e78-925f-a3e7bb9f0275)



## 🚧 Future Improvements

- **Full Market Order Support**
- **Portfolio holdings tracking**
- **CSV Export for transactions**
- **Real-time notifications for trades**

---

**Made with ❤️ by Carlos Trujillo**
