FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nodejs npm gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

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
