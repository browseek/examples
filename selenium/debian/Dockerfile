FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y python3 python3-pip chromium-browser chromium-chromedriver firefox-esr wget

# Set up working directory
WORKDIR /app

# Copy installation script
COPY install.sh .

# Make the script executable
RUN chmod +x install.sh

# Run the installation script
RUN ./install.sh

# Copy your application files
COPY . .

# Command to run your application
CMD ["python3", "main.py"]
