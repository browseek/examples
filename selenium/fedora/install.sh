#!/bin/bash
# Install Selenium on Fedora

# Update package manager
sudo dnf update -y

# Install Python and pip
sudo dnf install -y python3 python3-pip

# Install Selenium
pip3 install selenium

# Install WebDriver for Chrome
sudo dnf install -y chromium chromedriver

# Install WebDriver for Firefox
sudo dnf install -y firefox geckodriver

echo "Selenium installation completed."
