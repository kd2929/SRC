# Use Python 3.9.9 slim buster as the base image
FROM python:3.9.9-slim-buster

# Create a directory for the app and set permissions
RUN mkdir /app && chmod 777 /app

# Set the working directory to /app
WORKDIR /app

# Set environment variable to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install necessary packages
RUN apt-get update && apt-get install -y git python3 python3-pip ffmpeg

# Copy the current directory contents into the container at /app
COPY . .

# Install Python dependencies from requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Set the command to run the bash.sh script
CMD ["bash", "bash.sh"]
