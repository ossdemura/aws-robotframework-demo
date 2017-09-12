*** Settings ***
# We should have a PO (Page Object) for each page we interact with to concentrate there all related to them
Library  Selenium2Library

*** Keywords ***
Load
    #go to  http://www.amazon.com
    go to  ${START_URL}

Verify Page Loaded
    wait until page contains  Your Amazon.com



