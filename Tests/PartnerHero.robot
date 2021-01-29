*** Settings ***
Resource  ../Resources/Common.robot
Resource  ../Resources/PO/ContactUs.robot
Resource  ../Resources/PO/Navigation.robot
Resource  ../Resources/PO/Pricing.robot

Test Setup       Open Application
Test Teardown    Close Application


*** Test Cases ***
The User review prices and submits the "Contact Us" form
    User visits the landing page
    The User navigates to the Pricing Page
    User review prices and fills the "Contact Us" form
    User "Submits" the form
    The "Thank you" screen will load.



