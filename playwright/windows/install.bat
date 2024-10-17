@echo off
REM Install Playwright on Windows

REM Install Node.js and npm (assumes Node.js is already installed)
REM If not installed, download and install from https://nodejs.org/

REM Install Playwright
npm init -y
npm install -D playwright

REM Install Playwright browsers
npx playwright install

echo Playwright installation completed.
