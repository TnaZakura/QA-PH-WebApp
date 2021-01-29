*** Settings ***
Documentation    Pricing details on page
Library     SeleniumLibrary

*** Variables ***
${DedicatedTeamPrice}       xpath://*[@id="prices"]/div[2]/div[2]/div/div[3]/div/h2
${BTNShowPrices}             xpath://*[@id="gatsby-focus-wrapper"]/div[2]/main/div/div[1]/div[1]/a/button

*** Keywords ***
User review prices and fills the "Contact Us" form
    Click Element                       ${BTNShowPrices}
    Wait Until Page Contains Element    ${DedicatedTeamPrice}    timeout=30
    ${Price}=  Get Text                 ${DedicatedTeamPrice}
    Log                                 ${Price}
    Sleep  2s
    Click Element  ${GetInTouch}
    Sleep  2s
    User fills the "contact us" form   ${Price}

User clicks "Get In touch" button
    Click Element  ${GetInTouch}
    Sleep  2s
