#!/bin/bash

#!/bin/bash

# Script to download the latest Microsoft Edge WebDriver for Linux

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if wget is installed
if ! command_exists wget; then
    echo "Error: wget is not installed. Please install wget and try again."
    exit 1
fi

# URL for the latest Edge WebDriver
EDGE_DRIVER_URL="https://msedgedriver.azureedge.net/"

# Download directory
DOWNLOAD_DIR="$HOME"

# Create download directory if it doesn't exist
#mkdir -p "$DOWNLOAD_DIR"

# File containing the version information
INPUT_FILE="version.txt"

wget $EDGE_DRIVER_URL -O $INPUT_FILE

#cat $INPUT_FILE
#exit

# Check if tac is installed (reverse cat)
if ! command_exists tac; then
    echo "Error: tac is not installed. Please install it and try again."
    exit 1
fi

# Use grep to find all matching versions, then sort to get the latest
LATEST_VERSION=$(grep -oP 'https://msedgewebdriverstorage\.blob\.core\.windows\.net/edgewebdriver/\K\d+\.\d+\.\d+\.\d+(?=/edgedriver_linux64\.zip)' "$INPUT_FILE" | sort -V | tail -n 1)

if [ -z "$LATEST_VERSION" ]; then
    echo "Error: No matching version found in the file." >&2
    exit 1
fi

# Use tac to read the file in reverse, then use grep to find the first matching URL
LATEST_URL=$(grep -oP 'https://msedgewebdriverstorage\.blob\.core\.windows\.net/edgewebdriver/\d+\.\d+\.\d+\.\d+/edgedriver_linux64\.zip' "$INPUT_FILE" | sort -V | tail -n 1)

if [ -z "$LATEST_URL" ]; then
    echo "Error: No matching URL found in the file."
    exit 1
fi

echo "Latest version: $LATEST_VERSION"
echo "Download URL: $LATEST_URL"

echo "Downloading latest Edge WebDriver for Linux..."

if [ -z "$LATEST_URL" ]; then
    echo "Error: Failed to fetch the latest version number."
    exit 1
fi

# Construct the download URL
#DRIVER_URL="https://msedgedriver.azureedge.net/${LATEST_VERSION}/edgedriver_linux64.zip"
# Download the driver
DOWNLOAD_FILE="$DOWNLOAD_DIR/edgedriver_linux64.zip"
#echo "$DOWNLOAD_DIR" "$LATEST_URL"
wget $LATEST_URL -O $DOWNLOAD_DIR
#wget -N -P "$DOWNLOAD_DIR" "$LATEST_URL"

if [ $? -ne 0 ]; then
    echo "Error: Failed to download the Edge WebDriver."
    exit 1
fi
exit 1

# Unzip the driver
unzip -o "$DOWNLOAD_FILE" -d "$DOWNLOAD_DIR"

if [ $? -ne 0 ]; then
    echo "Error: Failed to extract the Edge WebDriver."
    exit 1
fi

# echo "Edge WebDriver extracted successfully."
# echo "You can find the driver at: $DOWNLOAD_DIR/msedgedriver"

# Make the driver executable
# chmod +x "$DOWNLOAD_DIR/msedgedriver"

rm $DOWNLOAD_FILE
sudo mv -f $DOWNLOAD_DIR/msedgedriver /usr/local/bin/msedgedriver
sudo chown root:root /usr/local/bin/msedgedriver
sudo chmod 0755 /usr/local/bin/msedgedriver

echo "EdgeDriver $EDGE_DRIVER_VERSION has been installed."
