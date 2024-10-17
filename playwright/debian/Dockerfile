FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nodejs npm libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 libgtk-3-0 libgbm1 libasound2 libpangocairo-1.0-0 libpango-1.0-0 libcairo2 libatspi2.0-0 libx11-6 libxcomposite1 libxdamage1 libxext6 libxfixes3 libxrandr2 libxrender1 libxtst6 fonts-liberation libappindicator3-1 libnss3 lsb-release xdg-utils

# Set up working directory
WORKDIR /app

# Copy installation script
COPY install.sh .

# Make the script executable
RUN chmod +x install_drivers.sh

# Run the installation script
RUN ./install_drivers.sh

# Copy your application files
COPY . .

# Command to run your application
CMD ["node", "main.js"]
