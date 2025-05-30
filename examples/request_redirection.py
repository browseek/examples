import os
from dotenv import load_dotenv
from browseek import BrowserRouter, RequestInterceptor

# Load environment variables from .env file
load_dotenv()

TEST_URL = os.getenv("TEST_URL")

class CustomInterceptor(RequestInterceptor):
    def intercept(self, request):
        if request.resource_type == "image":
            request.abort()
        elif "ads" in request.url:
            request.redirect("about:blank")
        return request

router = BrowserRouter()
router.add_browser("chrome")
router.set_request_interceptor(CustomInterceptor())

result = router.execute(TEST_URL, lambda page: len(page.query_selector_all("img")))
print(f"Number of images loaded: {result}")

router.close()
