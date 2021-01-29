*** Settings ***
Documentation    Keywords used for Test Setup  and Test Teardown
Library     SeleniumLibrary

*** Variables ***
${URL}              https://ph-web-v3-lyd8vff2i.vercel.app/
${BROWSER}          chrome


*** Keywords ***
Open Application
    [Tags]  Smoke
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Sleep  3s

Close Application
    Close Browser