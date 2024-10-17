#!/bin/bash
# Install Playwright on Fedora

# Update package manager
sudo dnf update -y

# Install Node.js and npm
sudo dnf install -y nodejs npm

# Install Playwright
npm init -y
npm install -D playwright

# Install browser dependencies
sudo dnf install -y atk cups-libs gtk3 ipa-gothic-fonts libXcomposite libXcursor libXdamage libXext libXi libXrandr libXScrnSaver libXtst pango at-spi2-atk libXt alsa-lib libdrm mesa-libgbm nss liberation-fonts

# Install Playwright browsers
npx playwright install
