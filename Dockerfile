# Use the official Python image from the Docker Hub
FROM python:3.12-slim

# install apt dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libffi-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libjpeg-dev \
    libfreetype6-dev \
    liblcms2-dev \
    libopenjp2-7-dev \
    libtiff5-dev \
    libwebp-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    tcl8.6-dev \
    tk8.6-dev \
    python3-tk \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    python3-cffi \
    python3-cryptography \
    python3-openssl \
    python3-lxml \
    python3-pillow \
    python3-numpy \
    python3-scipy \
    python3-matplotlib \
    python3-pandas \
    python3-sqlalchemy \
    python3-psycopg2 \
    python3-redis \
    python3-requests \
    python3-flask \
    python3-flask-cors \
    python3-flask-restful

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container at /app
COPY requirements.txt requirements.txt

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container at /app
COPY . .

# Set environment variables for Flask
ENV FLASK_APP=server.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=7860

# Expose port 7860 to the outside world
EXPOSE 7860

# Run the application
CMD ["python3", "server.py"]
