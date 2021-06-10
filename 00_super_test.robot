*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Suite Setup  test suite setup
Suite Teardown  test suite teardown
Default Tags      smoke

*** Keywords ***
Test Suite Setup
    Remove file    screenshots/selenium-screenshot-*
    Set Environment Variable  PATH  C:\\ChromeDriver
    Set Screenshot Directory  screenshots
    Open Browser  browser=chrome

Test Suite Teardown
    Close Browser

*** Variables ***


*** Test Cases ***
Test OK Button
    Go to  http://make-everything-ok.com/
    Wait Until Element Is Visible  //div[@id="button"]
    Click Element  //div[@id="button"]
    Capture Page Screenshot
    Wait Until Element Is Visible  //div[@id="answer"]  10
    Capture Page Screenshot
    Click Element  //div[@id="answer"]/p[@class="button"]
    Wait Until Element Is Visible  //div[@id="show"]/div[@class="close"]
    Capture Page Screenshot 
    Click Element  //div[@id="show"]/div[@class="close"]/span
    Wait Until Element Is Visible  //div[@id="button"]
    Capture Page Screenshot

Test Donation Button
    Go to  http://make-everything-ok.com/
    Wait Until Element Is Visible  //div[@id="d"]/form/input[3]
    Click Element  //div[@id="d"]/form/input[3]
    Sleep  1
    Capture Page Screenshot
    Location Should Contain  https://www.paypal.com/donate/

Test FB Button
    Go to  http://make-everything-ok.com/
    Sleep  5
    # Wait Until Element Is Visible  //*[@id="widget"]/div
    Click Element  //*[@id="b"]
    Sleep  1
    Capture Page Screenshot
    Location Should Contain 
    https://www.twitter.com/