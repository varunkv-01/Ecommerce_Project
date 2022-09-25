*** Settings ***
Documentation    To validate the Login form
Library     SeleniumLibrary
Test Teardown    Close Browser
Test Setup      open the browser with the morgage payment url
Resource        ../PO/Resource.robot


*** Variables ***
${Error_Messgae}    css:.alert-danger

*** Test Cases ***
Validate Unsuccesful Login

  Fill the login Form
  wait until it checkd and display error message
  verify error message is correct


*** Keywords ***

Fill the login Form
    Input Text      id:username     varunkv@gmail.com
    Input Password  id:password     12345
    Click Button    id:signInBtn

wait until it checkd and display error message

    Wait Until Element Is Visible   ${Error_Messgae}

verify error message is correct
    ${result} =  Get Text    css:.alert-danger
    Should Be Equal As Strings      ${result}   Incorrect username/password.
