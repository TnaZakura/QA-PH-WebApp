*** Settings ***
Documentation    Contact Us section, locators and keywords for user to submit their information.
Library     SeleniumLibrary

*** Variables ***

${ContactUsTittle}      xpath://div[@id='form']/h1

${Name}                 Jessica
${LastName}             Smith
${Email}                jsmith@no-email.com
${Company}              Smith Solutions
${CompanyURL}           ssolutions.com

#Input fields
${InFirstName}          name:firstName
${InLastName}           name:lastName
${InBusinessEmail}      name:email
${InCompanyName}        name:companyName
${InCompanyURL}         name:companyUrl
${InComments}           name:detail

#Radio button
${rdSharedTeam}         xpath://div[2]/main/div/div[4]/div[2]/div/div[1]/label

${BTNSend}              xpath://div[2]/main/div/div[8]/div/button
${BTNTellUsMore}        xpath://div[2]/main/div/div[6]/div/button
${GetInTouch}           xpath://*/div[2]/main/div/div[4]/div/div[3]/a/button

*** Keywords ***
User types information
    [Arguments]    ${Elementlocator}  ${Content}
    Wait Until Element Is Enabled     ${Elementlocator}  timeout=30
    Click Element       ${Elementlocator}
    Input Text	        ${Elementlocator}  ${Content}
    Sleep  2s

User fills the "contact us" form
    [Arguments]    ${Price}
    Sleep  1s
    Wait Until Page Contains Element  ${ContactUsTittle}   timeout=30
    User types information            ${InFirstName}        ${Name}
    User types information            ${InLastName}         ${LastName}
    User types information            ${InBusinessEmail}    ${Email}
    User types information            ${InCompanyName}      ${Company}
    User types information            ${InCompanyURL}       ${CompanyURL}
    Click Element                     ${rdSharedTeam}
    User Selects all checkboxes
    Click Element                     ${BTNTellUsMore}
    Wait Until Element Is Visible     ${InComments}
    User types information            ${InComments}         ${Price}
    Sleep  2s

User "Submits" the form
    Double Click Element               ${BTNSend}
    Sleep  3s

User Selects all checkboxes
    ${index2}=    Set Variable    1
    FOR    ${index}    IN RANGE  5
        Exit For Loop If    ${index} > 4
        Click Element   //div[2]/main/div/div[4]/div[1]/div/div[${index2}]/input
        Sleep  1s
        ${index2}=    Evaluate    ${index2} + 1
        ${index}=    Evaluate    ${index} + 1
    END


