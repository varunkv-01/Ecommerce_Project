*** Settings ***
Documentation    All thw page object and keyowrds of checkout page
Library     SeleniumLibrary


*** Variables ***
${countryname}          India

*** Keywords ***
enter details of checkout
    input text          country         ${countryname}
    sleep               5
    wait until element is visible       //a[text()='${countryname}']
    click element                //a[text()='${countryname}']
    click element              css:.checkbox
    click button            xpath:(//*[@class="btn btn-success btn-lg"])
    wait until element is visible       xpath: (//*[@class="alert alert-success alert-dismissible"])