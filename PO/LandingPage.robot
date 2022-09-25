*** Settings ***
Documentation    All thw page object and keyowrds of landing page
Library     SeleniumLibrary


*** Keywords ***

Fill the login Form
    Input Text      id:username     ${invalid_username}
   Input Password  id:password     ${Password}
    Click Button    id:signInBtn

Fill the login Form_C
    Input Text      id:username     ${username}
    Input Password  id:password     ${Password}
    Click Button    id:signInBtn

wait until it checkd and display error message
    Wait Until Element Is Visible   ${Error_Messgae}

verify error message is correct
    ${result} =  Get Text    css:.alert-danger
    Should Be Equal As Strings      ${result}   Incorrect username/password.

Fill the login detailes and select the User option
    Input Text      id:username     ${username}
    Input Password  id:password     ${Password}
    Click Element   css:input[value='user']
    Wait Until Element Is Visible   css:.modal-content
    Click Element   okayBtn

    Select From List By Value       css:select.form-control     teach
    Select Checkbox     terms
    Checkbox Should Be Selected     terms