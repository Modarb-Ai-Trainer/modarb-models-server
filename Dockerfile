# Use the official Python image from the Docker Hub
FROM python:3.9-slim

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
CMD ["flask", "run"]
