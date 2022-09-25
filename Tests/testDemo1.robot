*** Settings ***
Documentation    To validate the Login form
Library          SeleniumLibrary
Library         Collections
Test Setup      open the browser with the morgage payment url
Resource        ../PO/Resource.robot
Test Teardown    Close Browser Session

*** Variables ***
${element_visible}                css:.navbar-brand
*** Test Cases ***
#Validate Unsuccesful Login
#    Fill the login Form
#    wait until it checkd and display error message
#    verify error message is correct


Validate cards display in the shopping page
    Fill the login Form_C
    wait until it element is located in page
    verify card titles in shope page
    Select the card     Nokia Edge

Select the form and navigate to child window
    Fill the login detailes and select the User option


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

wait until it element is located in page

    Wait Until Element Is Visible   ${element_visible}

verify error message is correct
    ${result} =  Get Text    css:.alert-danger
    Should Be Equal As Strings      ${result}   Incorrect username/password.

verify card titles in shope page
  @{ExpectedList} =     Create List     iphone X   Samsung Note 8     Nokia Edge   Blackberry
  ${elements} =    Get WebElements   css:.card-title
  @{actualList}=    Create List

  FOR   ${element}  IN      @{elements}
     Log    ${element.text}
     Append To List     ${actualList}   ${element.text}
  END
  Lists Should Be Equal     ${ExpectedList}      ${actualList}


Select the card
    ${elements} =    Get WebElements   css:.card-title
    [arguments]     ${cardsName}
    ${index}        Set Variable    1
     FOR   ${element}  IN      @{elements}
        Exit For Loop If     '${cardsName}' == '${element.text}'
        ${index} =  Evaluate      ${index} + 1
     END
    click button    xpath:(//*[@class="card-footer"])[${index}]/button

Fill the login detailes and select the User option
    Input Text      id:username     ${username}
    Input Password  id:password     ${Password}
    Click Element   css:input[value='user']
    Wait Until Element Is Visible   css:.modal-content
    Click Element   okayBtn

    Select From List By Value       css:select.form-control     teach
    Select Checkbox     terms
    Checkbox Should Be Selected     terms