import os
import asyncio
import warnings
from dotenv import load_dotenv
from browseek import BrowserRouter

# Load environment variables from .env file
load_dotenv()

TEST_URL = os.getenv("TEST_URL", "https://example.com")

async def main():
    router = None
    try:
        # Initialize the router
        router = BrowserRouter()

        # Add browser instances with Playwright
        await router.add_browser("playwright", count=2, options={"headless": True})

        # Use the router to perform tasks with Playwright
        print("Performing task with Playwright:")
        playwright_result = await router.execute(TEST_URL, lambda page: page.title())
        print(f"Page title: {playwright_result}")

        # Demonstrate a more complex operation (e.g., finding an element and clicking it)
        print("\nPerforming complex operation:")
        await router.execute(TEST_URL, complex_operation)
        print("Complex operation completed")

        # Demonstrate switching between browser instances
        print("\nSwitching between browser instances:")
        await router.execute("https://example.com", lambda page: page.goto("https://example.com"))
        await router.execute("https://example.org", lambda page: page.goto("https://example.org"))
        print("Navigated to different URLs with different browser instances")

    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        # Clean up
        if router:
            await router.close()

async def complex_operation(page):
    # Wait for the page to load
    await page.wait_for_load_state("networkidle")

    # Check if there's a cookie consent banner and handle it
    consent_button = page.locator('button:has-text("Accept")')
    if await consent_button.is_visible():
        await consent_button.click()

    # Wait for and click a more specific element (e.g., a navigation link)
    await page.wait_for_selector('nav a', state='visible')
    first_nav_link = page.locator('nav a').first
    await first_nav_link.click()

    # Wait for the new page to load
    await page.wait_for_load_state("networkidle")

if __name__ == "__main__":
    # Suppress warnings about the event loop being closed
    warnings.filterwarnings("ignore", message="Exception ignored.*")
    warnings.filterwarnings("ignore", message="Task was destroyed but it is pending!")

    asyncio.run(main())

print("\nScript execution completed.")

# DriverRouter Explanation:
# The BrowserRouter class uses the DriverRouter internally to manage browser automation.
# In this example, we're using Playwright through the BrowserRouter interface.
# The 'execute' method of the router automatically selects an available browser instance,
# allowing for seamless operation across multiple browser instances.
