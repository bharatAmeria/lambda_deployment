# Dockerfile
FROM python:3.9-slim

WORKDIR /app
ADD . /app
COPY app/model.pkl /app

# Install the dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code (including model.pkl and templates) into the container
COPY . /app/

# Expose the port that Flask will run on
EXPOSE 5050

# Set the command to run the Flask app
CMD ["python", "app/app.py", "--host=0.0.0.0", "--port=5050"]
