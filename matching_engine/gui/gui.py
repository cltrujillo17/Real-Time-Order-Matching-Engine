import streamlit as st
import yfinance as yf
import pandas as pd
import plotly.graph_objects as go
import socket
import json
import time


if "transactions" not in st.session_state:
    st.session_state.transactions = []

if "wallet" not in st.session_state:
    st.session_state.wallet = {
        "spent": 0.0,
        "earned": 0.0,
        "cash": 10000.0  # starting balance
    }



st.title("Real-Time Order Matching Engine")

st.subheader("📈 Live Market Price")

ticker_symbol = st.text_input("Enter Ticker Symbol", value="AAPL")
ticker = yf.Ticker(ticker_symbol)
history = ticker.history(period="5d", interval="1h")  # Last 5 days, hourly


try:
    live_price = ticker.info["regularMarketPrice"]
    st.metric(label=f"{ticker_symbol} Price", value=f"${live_price:.2f}")
    
    st.subheader(f"📊 {ticker_symbol} Recent Price Chart")

    if not history.empty:
        # Keep only last 12 candles (e.g., ~12 hours if interval='1h')
        recent = history.tail(12)

        current_price = recent["Close"].iloc[-1]
        price_padding = current_price * 0.01  # ±1% range for y-axis zoom

        fig = go.Figure(data=[go.Candlestick(
            x=recent.index,
            open=recent['Open'],
            high=recent['High'],
            low=recent['Low'],
            close=recent['Close'],
            increasing_line_color='green',
            decreasing_line_color='red'
        )])

        fig.update_layout(
        title=f"{ticker_symbol} - Last 12 Hours",
        xaxis_rangeslider_visible=False,
        xaxis=dict(
            type="category"  # removes time gaps between candles
        ),

        height=400,
        margin=dict(l=10, r=10, t=40, b=10)
    )


        st.plotly_chart(fig, use_container_width=True)
    else:
        st.warning("No historical data available for this ticker.")

except:
    st.warning("Could not fetch live price.")
    live_price = 0.00


side = st.selectbox("Side", ["buy", "sell"])
order_type = st.selectbox("Type", ["limit", "market"])
price = live_price
quantity = st.number_input("Quantity", min_value=1, step=1)
submit = st.button("Submit Order")

if submit:
    # Calculate total order value
    total_value = float(price) * int(quantity)

    if side == "buy" and total_value > st.session_state.wallet["cash"]:
        st.error("Insufficient funds to complete this order.")
    else:
        order = {
            "order_id": int(time.time()), 
            "side": side,
            "type": order_type,
            "price": price,
            "quantity": quantity,
            "timestamp": int(time.time()),
            "ticker": ticker_symbol
        }

        try:
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                s.connect(("localhost", 9999))
                s.sendall(json.dumps(order).encode("utf-8"))
                response = s.recv(1024).decode()
            st.success(f"Server response: {response}")

            # Update wallet after successful submission
            if side == "buy":
                st.session_state.wallet["cash"] -= total_value
                st.session_state.wallet["spent"] += total_value
            else:
                st.session_state.wallet["cash"] += total_value
                st.session_state.wallet["earned"] += total_value

            # Log the transaction
            st.session_state.transactions.append({
                "Time": time.strftime("%H:%M:%S"),
                "Side": side,
                "Ticker": ticker_symbol,
                "Price": round(price, 2),
                "Qty": quantity,
                "Total ($)": round(total_value, 2)
            })

        except Exception as e:
            st.error(f"Connection error: {e}")




    st.header("📘 Live Order Book")

if st.button("Refresh Order Book"):
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.connect(("localhost", 9999))
            s.sendall(b"GET_BOOK")
            response = s.recv(4096).decode()
            book = json.loads(response)

        buy = book.get("buy", [])
        sell = book.get("sell", [])

    except Exception as e:
        st.error(f"Error fetching order book: {e}")

# ===========================
# 💰 Summary
# ===========================
st.header("💰 Summary")

wallet = st.session_state.wallet
net = wallet["earned"] - wallet["spent"]

col1, col2, col3 = st.columns(3)
col1.metric("💸 Spent", f"${wallet['spent']:.2f}")
col2.metric("💰 Earned", f"${wallet['earned']:.2f}")
col3.metric("📊 Net", f"${net:.2f}", delta=f"{net:.2f}")

# ===========================
# 📜 Transaction Log
# ===========================
st.header("📜 Transaction Log")

if st.session_state.transactions:
    st.dataframe(st.session_state.transactions)
else:
    st.write("_No orders submitted yet._")

# ===========================
# 💼 Wallet
# ===========================
with st.expander("💼 Wallet Management", expanded=False):
    st.subheader("Available Cash")
    st.write(f"💵 **${st.session_state.wallet['cash']:.2f}**")

    col1, col2 = st.columns(2)
    with col1:
        deposit = st.number_input("Deposit Amount", min_value=0.0, value=0.0, step=10.0, format="%.2f")
        if st.button("➕ Deposit"):
            st.session_state.wallet["cash"] += deposit
            st.success(f"Deposited ${deposit:.2f}")

    with col2:
        withdraw = st.number_input("Withdraw Amount", min_value=0.0, value=0.0, step=10.0, format="%.2f")
        if st.button("➖ Withdraw"):
            if withdraw > st.session_state.wallet["cash"]:
                st.error("Insufficient funds!")
            else:
                st.session_state.wallet["cash"] -= withdraw
                st.success(f"Withdrew ${withdraw:.2f}")


