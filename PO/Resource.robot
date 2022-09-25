*** Settings ***
Documentation    To validate the Login form
Library     SeleniumLibrary


*** Variables ***
${Error_Messgae}    css:.alert-danger
${invalid_username}     varunvmgowda
${username}         rahulshettyacademy
${Password}         learning
${C_password}       learning
${Url}              https://www.rahulshettyacademy.com/loginpagePractise/
${browsername}      Chrome


*** Keywords ***
open the browser with the morgage payment url

    Create Webdriver    ${browsername}   executable_path=Resoursces/${browsername}driver
    Go To               ${Url}


Close Browser Session
    Close Browser

