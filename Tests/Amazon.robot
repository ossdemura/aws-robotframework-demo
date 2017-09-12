*** Settings ***
# When executing the test Tests\Amazon.robot it will try look for the resources files in the Tests folder
# then you need to specify that the Resource folder is actually a level upper
Resource  ../Resources/Common.robot
Resource  ../Resources/Amazon.robot

# The following will run before all my test cases once
Suite Setup  Insert Testing Data

# The following will run for each test case
Test Setup  Begin Web Test
Test Teardown  End Web Test

# The following will run after all my test cases once
Suite Teardown  Cleanup Testing Data

*** Variables ***
${BROWSER} =  chrome
${START_URL} =  http://www.amazon.com
${SEARCH_TERM} =  Ferrari 458

*** Test Cases ***
User can search for products
    [Documentation]  This is the basic info about the test case
    [Tags]  Current
    Amazon.Search for Products

User must sign to check out
    [Documentation]  This is the basic info about the test case
    [Tags]  Smoke
    Amazon.Search for Products
    Amazon.Select Product from Search Results
    Amazon.Add Product to Cart
    Amazon.Begin Checkout



