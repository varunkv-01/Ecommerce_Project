*** Settings ***
Documentation    To validate the Login form
Library          SeleniumLibrary
Library         Collections
Library         String
Test Setup      open the browser with the morgage payment url
Resource        ../PO/Resource.robot
Test Teardown    Close Browser Session


*** Variables ***
${Error_Messgae}    css:.alert-danger

*** Test Cases ***
Validate Child Window Functionality
    Select the link of the child window
    verify the user is Switched to child window
    Grab the Email ID in the child window
    Switch to parent window and enter the email id

*** Keywords ***
Select the link of the child window
    Click Element       css:.blinkingText
    sleep               5

verify the user is Switched to child window
    Switch Window       New
    Wait Until Element Is Visible   css:h1


Grab the Email ID in the child window
     ${text} =       Get Text    css:.red
     @{word} =       Split String    ${text}    at
     #0 -> Please email us
     #1 ->  mentor@rahulshettyacademy.com with below template to receive response
    ${splited_test} =    get from list      ${word}     1
     log    ${splited_test}
     @{word2} =       Split String    ${splited_test}
     #0 -> mentor@rahulshettyacademy.com
     #1 -> with below template to receive response
     ${email} =    get from list      ${word2}  0
     Set Global Variable    ${email}

Switch to parent window and enter the email id

    Switch Window       MAIN
    Title Should Be     LoginPage Practise | Rahul Shetty Academy
    Input Text      id:username     ${email}





