from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from robot.libraries.BuiltIn import BuiltIn

def setup_chrome_driver():
    chrome_driver_path = ChromeDriverManager().install()
    options = webdriver.ChromeOptions()
    options.add_argument("--headless")
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    driver = webdriver.Chrome(executable_path=chrome_driver_path, options=options)
    BuiltIn().set_library_search_order('SeleniumLibrary')
    selenium_lib = BuiltIn().get_library_instance('SeleniumLibrary')
    selenium_lib.register_driver(driver, "chrome")