*** Settings ***
Documentation    All thw page object and keyowrds of checkout page
Library     SeleniumLibrary

*** Keywords ***
verify selected items are present at checkout Page
    click element    xpath:(//*[@class='btn btn-success'])


