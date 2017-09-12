*** Settings ***
Library  Selenium2Library

*** Keywords ***
Begin Web Test
    # open browser  about:blank  ${BROWSER}
    ${c_opts} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${c_opts}   add_argument    headless
    Call Method    ${c_opts}   add_argument    disable-gpu
    Call Method    ${c_opts}   add_argument    no-sandbox
    Call Method    ${c_opts}   add_argument    window-size\=1024,768
    Create Webdriver    Chrome    crm_alias    chrome_options=${c_opts}

End Web Test
    # close browser
    Close All Browsers

Insert Testing Data
    log  I am setting up the test data...
    Custom Keyboard 1
    Custom Keyboard 2
    ${c_opts} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${c_opts}   add_argument    headless
    Call Method    ${c_opts}   add_argument    disable-gpu
    Call Method    ${c_opts}   add_argument    no-sandbox
    Call Method    ${c_opts}   add_argument    window-size\=1024,768
    Create Webdriver    Chrome    crm_alias    chrome_options=${c_opts}

Cleanup Testing Data
    log  I am cleaning up the test data...
    Close All Browsers

Custom Keyboard 1
    log  Doing keyboard 1...

Custom Keyboard 2
    log  Doing keyboard 2...