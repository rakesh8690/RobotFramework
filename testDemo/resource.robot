*** Settings ***
Documentation    A resource file with reusable keywords and variables
...             The system specific keywords created here form our own
...             domain specific language. They utilize keywords provided by the importd selenium library.\
Library         SeleniumLibrary


*** Variables ***
${user_name}            rahulshettyacademy
${invalid_password}     12345
${valid_password}       learning
${url}                  https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***

open the browser with mortgage payment url
    Create Webdriver    Chrome
    Go To                ${url}
    Maximize Browser Window

Close browser session
    Close Browser




