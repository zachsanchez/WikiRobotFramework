*** Settings ***
Documentation       All page objects/keywords for language page
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../PO/Generic.robot


*** Variables ***
${language_links}       css:.central-featured



*** Keywords ***
Validate And Select Available Language
    [Arguments]             ${language_choice}
    Wait Until Element Passed Is Visible       ${language_links}
    Page Should Contain                        ${language_choice}
    Click Element                              xpath://div/a[strong='${language_choice}']