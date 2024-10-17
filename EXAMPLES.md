# Examples

This document provides examples of how to use the various web automation tools in this project.

## Playwright

```javascript
// Example Playwright script
const { chromium } = require('playwright');

(async () => {
  const browser = await chromium.launch();
  const page = await browser.newPage();
  await page.goto('https://example.com');
  await page.screenshot({ path: 'example.png' });
  await browser.close();
})();
```

## Puppeteer

```javascript
// Example Puppeteer script
const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto('https://example.com');
  await page.screenshot({ path: 'example.png' });
  await browser.close();
})();
```

## Selenium

```javascript
// Example Selenium script
const { Builder, By, Key, until } = require('selenium-webdriver');

(async function example() {
  let driver = await new Builder().forBrowser('chrome').build();
  try {
    await driver.get('https://example.com');
    await driver.takeScreenshot();
  } finally {
    await driver.quit();
  }
})();
