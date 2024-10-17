#!/bin/bash
# Install Playwright on Debian/Ubuntu

# Update package manager
sudo apt-get update
sudo apt-get upgrade -y

# Install Node.js and npm
sudo apt-get install -y nodejs npm

# Install Playwright
npm init -y
npm install -D playwright

# Install browser dependencies
sudo apt-get install -y libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 libgtk-3-0 libgbm1 libasound2 libpangocairo-1.0-0 libpango-1.0-0 libcairo2 libatspi2.0-0 libx11-6 libxcomposite1 libxdamage1 libxext6 libxfixes3 libxrandr2 libxrender1 libxtst6 fonts-liberation libappindicator3-1 libnss3 lsb-release xdg-utils

# Install Playwright browsers
npx playwright install
