# Sử dụng Python 3.10 để tương thích với TensorFlow
FROM python:3.10-bullseye

# Đặt thư mục làm việc
WORKDIR /app

# Cài đặt thư viện hệ thống cần thiết


RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev

# Copy ode vào container
COPY . /app
COPY req.txt /app/req.txt

# Nâng cấp pip và cài thư viện Python
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Mở port 8501 (Streamlit)
EXPOSE 8501

# Chạy ứng dụng Streamlit
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
