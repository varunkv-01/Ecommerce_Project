*** Settings ***
Documentation    To validate the Login form
Library          SeleniumLibrary
Library         Collections
Library         ../CustomLibraries/Shop.py
Test Setup      open the browser with the morgage payment url
Resource        ../PO/Resource.robot
Resource        ../PO/LandingPage.robot
Resource        ../PO/ShopPage.robot
Resource        ../PO/CheckOutPage.robot
Resource        ../PO/ConfirmationPage.robot
Test Teardown    Close Browser Session

*** Variables ***
@{listofproduct}        Blackberry      Nokia Edge


*** Test Cases ***
Validate Unsuccesful Login
   [Tags]       smoke
   LandingPage.Fill the login Form
   LandingPage.wait until it checkd and display error message
   LandingPage.verify error message is correct


Validate cards display in the shopping page
    [Tags]      Regression
    LandingPage.Fill the login Form_C
    ShopPage.wait until it element is located in page
    ShopPage.verify card titles in shope page
    ShopPage.Select the card     Nokia Edge
    add items to cart and checkout       ${listofproduct}
    ShopPage.click on checkout button
    CheckOutPage.verify selected items are present at checkout Page
    ConfirmationPage.enter details of checkout

Select the form and navigate to child window
   LandingPage.Fill the login detailes and select the User option

