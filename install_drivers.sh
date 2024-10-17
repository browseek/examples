#!/bin/bash

# Determine OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
else
    echo "Unsupported OS"
    exit 1
fi

# Determine architecture
ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
    ARCH="x64"
elif [[ "$ARCH" == "aarch64" || "$ARCH" == "arm64" ]]; then
    ARCH="arm64"
else
    echo "Unsupported architecture"
    exit 1
fi

# Install Node.js dependencies
npm install

# Install Python dependencies
pip install -r requirements.txt

# Install browser drivers
install_driver() {
    local driver=$1
#    local driver_path="drivers/$driver/$OS/$ARCH"
    local driver_path="drivers/$driver/$OS"
    if [ -f "$driver_path/install.sh" ]; then
        echo "Installing $driver driver..."
        bash "$driver_path/install.sh"
    else
        echo "$driver driver installation script not found for $OS $ARCH"
    fi
}

install_driver "chromedriver"
install_driver "geckodriver"
install_driver "edgedriver"

echo "Installation complete!"
