require('dotenv').config({ path: '../.env' });
const { chromium } = require('playwright');

const TEST_URL = process.env.TEST_URL || 'https://example.com';

(async () => {
  const browser = await chromium.launch();
  const page = await browser.newPage();
  
  await page.goto(TEST_URL);
  
  await page.screenshot({ path: 'example.png' });
  
  await browser.close();
  
  console.log('Test completed successfully!');
})();
