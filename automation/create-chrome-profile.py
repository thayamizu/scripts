# -*- coding: utf-8 -*-
import os
from selenium.webdriver import Chrome, ChromeOptions

# create browser profile directory under current directory
userdata_dir = 'UserData'
os.makedirs(userdata_dir, exist_ok=True)

options = ChromeOptions()
options.add_argument('--user-data-dir=' + userdata_dir)
