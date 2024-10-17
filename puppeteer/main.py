import asyncio
from pyppeteer import launch

async def run():
    browser = await launch()
    page = await browser.newPage()
    await page.goto('https://example.com')
    title = await page.title()
    print(title)
    await browser.close()

if __name__ == "__main__":
    asyncio.get_event_loop().run_until_complete(run())
