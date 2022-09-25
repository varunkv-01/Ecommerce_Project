*** Settings ***
Documentation    To validate the Login form
Library     SeleniumLibrary
Test Setup      open the browser with the morgage payment url
Resource        ../PO/Resource.robot
Test Teardown    Close Browser
Test Template   Validate Unsuccesful Login


*** Variables ***
${Error_Messgae}    css:.alert-danger

*** Test Cases ***      username        password
Invalidate usenames     gfdgfg          learning
Invalid password        rahulshetty     poludec
Spcial characters       va_@6&         learning

*** Keywords ***
Validate Unsuccesful Login
    [Arguments]         ${username}     ${password}


  Fill the login Form   ${username}     ${password}
  wait until it checkd and display error message
  verify error message is correct



Fill the login Form
    [arguments]         ${username}     ${password}
    Input Text      id:username     ${username}
    Input Password  id:password     ${password}
    Click Button    id:signInBtn
    print("varun v gowda")
    print("new commite")

wait until it checkd and display error message
    Wait Until Element Is Visible   ${Error_Messgae}

verify error message is correct
    ${result} =  Get Text    css:.alert-danger
    Should Be Equal As Strings      ${result}   Incorrect username/password.


