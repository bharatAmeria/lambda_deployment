# Use official Python image with Alpine
FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    cmake \
    build-essential \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /app

# Copy the whole app folder
COPY app/ .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Flask uses
EXPOSE 6000

# Run the app
CMD ["python3", "app.py"]


