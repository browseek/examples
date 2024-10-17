@echo off
REM Install Puppeteer on Windows

REM Install Node.js and npm (assumes Node.js is already installed)
REM If not installed, download and install from https://nodejs.org/

REM Install Puppeteer
npm init -y
npm install puppeteer

echo Puppeteer installation completed.
echo Note: Puppeteer will download and manage its own version of Chromium.
