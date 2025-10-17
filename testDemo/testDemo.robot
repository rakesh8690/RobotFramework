*** Settings ***
Documentation      To validate the login page
Library            SeleniumLibrary
Test Setup         open the browser with mortgage payment url
Test Teardown      Close browser session
Resource           resource.robot



*** Variables ***
${Login_Error_Message}    css:.alert-danger
${shop_page_load}         css:.nav-link

*** Test Cases ***
#Validate Unsuccessful login
#
#    Fill the login form        ${user_name}    ${invalid_password}
#    wait until element is located in the page    ${Login_Error_Message}
#    Verify error message is correct

Validate cart display in the shopping page
    Fill the login form    ${user_name}    ${valid_password}
    wait until element is located in the page    ${shop_page_load}\
    Verify cart details on the shop page


*** Keywords ***

Fill the login form
    [arguments]        ${username}    ${password}
    Input Text        id:username     ${username}
    Input Password    id:password     ${password}
    Click Button      signInBtn

wait until element is located in the page
    [arguments]                      ${elements}
    Wait Until Element Is Visible    ${elements}

Verify error message is correct
#    ${result}=    Get Text    ${Login_Error_Message}
#    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Login_Error_Message}    Incorrect username/password.


Verify cart details on the shop page

    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements} =    Get WebElements    css:.card-title
    FOR    ${element}    IN     @{elements}
        
        log    ${element.text}

    END
