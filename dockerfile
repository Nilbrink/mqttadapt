FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy dependencies first for efficient caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY mqtt_client.py .

# Default environment variables
ENV MQTT_BROKER=test.mosquitto.org
ENV MQTT_PORT=1883
ENV MQTT_TOPIC=my/test/topic
ENV MQTT_MESSAGE="Hello from Docker!"

# Run the script
CMD ["python", "mqtt_client.py"]