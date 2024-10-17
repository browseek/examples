FROM fedora:latest

# Install dependencies
RUN dnf update -y && \
    dnf install -y nodejs npm pango.x86_64 libXcomposite.x86_64 libXcursor.x86_64 libXdamage.x86_64 libXext.x86_64 libXi.x86_64 libXtst.x86_64 cups-libs.x86_64 libXScrnSaver.x86_64 libXrandr.x86_64 GConf2.x86_64 alsa-lib.x86_64 atk.x86_64 gtk3.x86_64 ipa-gothic-fonts xorg-x11-fonts-100dpi xorg-x11-fonts-75dpi xorg-x11-utils xorg-x11-fonts-cyrillic xorg-x11-fonts-Type1 xorg-x11-fonts-misc

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
