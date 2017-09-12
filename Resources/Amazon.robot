*** Settings ***
Library  Selenium2Library
Resource  PO/LandingPage.robot

*** Variables ***
# TODO: this should go in a PO file called "TopNav.robot"
${TOPNAV_SEARCH_BAR_TEXT_BOX} =         id=twotabsearchtextbox
${TOPNAV_SEARCH_BAR_SUBMIT_BUTTON} =    xpath=//*[@id="nav-search"]/form/div[2]/div/input

*** Keywords ***
Search for Products
    LandingPage.Load
    LandingPage.Verify Page Loaded

    input text  ${TOPNAV_SEARCH_BAR_TEXT_BOX}  "${SEARCH_TERM}"
    click button  ${TOPNAV_SEARCH_BAR_SUBMIT_BUTTON}
    wait until page contains element  id=s-result-count
    element should contain  id=s-result-count  "${SEARCH_TERM}"

Select Product from Search Results
    click link  css=#result_0 a.s-access-detail-page
    wait until page contains  Back to search results

Add Product to Cart
    click button  id=add-to-cart-button
    sleep  3
    ${present}=  run keyword and return status  element should be visible  xpath=//*[@id="a-popover-4"]/div/div[1]/button
    run keyword   run keyword if  ${present}  click element  xpath=//*[@id="a-popover-4"]/div/div[1]/button
    wait until page contains  Added to Cart

Begin Checkout
    click link  id=hlb-ptc-btn-native
    page should contain element  id=signInSubmit


