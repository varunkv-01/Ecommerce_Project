*** Settings ***
Documentation    All thw page object and keyowrds of Shopage
Library     SeleniumLibrary


*** Variables ***
${element_visible}  css:.navbar-brand

*** Keywords ***

wait until it element is located in page

    Wait Until Element Is Visible   ${element_visible}

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

click on checkout button
    click element       xpath:(//*[@class="nav-link btn btn-primary"])




