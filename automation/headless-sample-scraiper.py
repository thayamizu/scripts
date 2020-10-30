#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import time
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver import Chrome, ChromeOptions
from selenium.webdriver.common.by import By

# define constants
WAIT_SECOND = 15
PAGE_LIMIT = 1
CONTENT_LIMIT = 1
TARGET_VALUE = "target"

# setup driver options
options = ChromeOptions()
options.add_argement('--headless')
options.add_argument('--user-data-dir=プロフィールディレクトリを指定')
options.add_argument('--profile-directory=Profile 1')

# wakeup chrome
driver = Chrome(options=options)

# scraiping
for page in range(1, PAGE_LIMIT):
    driver.get(f'https://example.com?page={page}')
    WebDriverWait(driver, WAIT_SECOND).until(
        EC.presence_of_all_elements_located)

    for index in range(1, CONTENT_LIMIT + 1):
        position = index
        element = driver.find_element_by_css_selector(f'btn {position}')
        if element.get_attribute('value') == TARGET_VALUE:
            element.click()
            WebDriverWait(driver, WAIT_SECOND).until(
                EC.presence_of_all_elements_located)
            time.sleep(2)

    time.sleep(5)

# finalize
driver.quit()
