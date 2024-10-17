FROM fedora:latest

# Install dependencies
RUN dnf update -y && \
    dnf install -y nodejs npm atk cups-libs gtk3 ipa-gothic-fonts libXcomposite libXcursor libXdamage libXext libXi libXrandr libXScrnSaver libXtst pango at-spi2-atk libXt alsa-lib libdrm mesa-libgbm nss liberation-fonts

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
