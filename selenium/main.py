from selenium import webdriver
from selenium.webdriver.chrome.options import Options

def run():
    chrome_options = Options()
    chrome_options.add_argument("--headless")
    driver = webdriver.Chrome(options=chrome_options)
    
    driver.get("https://example.com")
    print(driver.title)
    
    driver.quit()

if __name__ == "__main__":
    run()
