# Use official Python image as the base
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the contents of the local app directory into the container
COPY app/ .

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Set the environment variable for Flask
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# Expose the port Flask will run on
EXPOSE 6000

# Command to run the Flask app
CMD ["flask", "run", "--port=6000"]

