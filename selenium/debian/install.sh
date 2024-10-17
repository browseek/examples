#!/bin/bash
# Install Selenium on Debian/Ubuntu

# Update package manager
sudo apt-get update
sudo apt-get upgrade -y

# Install Python and pip
sudo apt-get install -y python3 python3-pip

# Install Selenium
pip3 install selenium

# Install WebDriver for Chrome
sudo apt-get install -y chromium-browser chromium-chromedriver

# Install WebDriver for Firefox
sudo apt-get install -y firefox-esr
wget https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz
sudo tar -xvf geckodriver-v0.30.0-linux64.tar.gz -C /usr/local/bin/
sudo chmod +x /usr/local/bin/geckodriver
rm geckodriver-v0.30.0-linux64.tar.gz

echo "Selenium installation completed."
