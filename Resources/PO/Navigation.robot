*** Settings ***
Documentation    Keywords used for Navigation in the application-
Library     SeleniumLibrary

*** Variables ***
${MainTitle}        //div/h1[@class='typography__H1-xor7fr-2 isxhnW']
${BTNCookieOk}      xpath://*[@id="cookies-consent"]/div/div[2]/button

${PricingLocator}      xpath://div[1]/div[1]/div/div/div/a[2]
${PricingMainTitle}    xpath://main/div/div/div/h1

${Flag}                 https://ph-web-v3-lyd8vff2i.vercel.app/contact-thank-you/
*** Keywords ***
User visits the landing page
    Wait Until Page Contains Element  ${MainTitle}  timeout=20
    Click Element  ${BTNCookieOk}
    Sleep  1s

The User navigates to the Pricing Page
    Click Element  ${PricingLocator}
    Sleep  1s
    Wait Until Page Contains Element  ${PricingMainTitle}  timeout=30

The "Thank you" screen will load.
    Sleep  2s
    Wait Until Page Contains Element     //div[2]/main/div/div/div[2]/h1    timeout=45
    Wait Until Element Is Visible       //div[2]/main/div/div/div[2]/h1     timeout=45
    ${ThankYouURL}=    Get Location
    Log   ${ThankYouURL}
    Should Be Equal     ${ThankYouURL}  ${Flag}