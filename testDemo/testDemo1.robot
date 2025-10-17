*** Settings ***
Documentation    To validate the login page
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${Login_Error_Message}    css:.alert-danger

*** Test Cases ***
Validate Unsuccessful login
    open the browser with mortgage payment url
    Fill the login form
    wait until it checks and display the error message
    Verify error message is correct

*** Keywords ***
open the browser with mortgage payment url
    Create Webdriver    Chrome    
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    Input Text        id:username    earthshaking
    Input Password    id:password    12345
    Click Button      signInBtn

wait until it checks and display the error message
    Wait Until Element Is Visible    ${Login_Error_Message}

Verify error message is correct
#    ${result}=    Get Text    ${Login_Error_Message}
#    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Login_Error_Message}    Incorrect username/password.

    