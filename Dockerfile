# FROM public.ecr.aws/lambda/python:3.9

# # Set working directory
# WORKDIR /var/task

# # Copy requirements file and install dependencies
# COPY app/requirements.txt ./
# RUN pip install -r requirements.txt

# # Copy the entire app directory to the working directory
# COPY app /var/task/app

# # Define Lambda entry point
# CMD ["lambda_handler.handler"]

# Dockerfile
FROM python:3.9-slim

WORKDIR /app
ADD . /app

RUN pip install -r requirements.txt

CMD ["python", "app.py"]


