*** Settings ***

Documentation       All page objects/keywords for login page
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../PO/Generic.robot



*** Variables ***
${login_button}    css:#wpLoginAttempt


*** Keywords ***


Fill The Login Form And Submit
    [Arguments]         ${username}     ${password}
    Input Text          css:#wpName1   ${username}
    Input Password      css:#wpPassword1      ${password}
    Click Button        ${login_button}

Verify Error Message Is Correct
    [Arguments]                 ${error_text}
    Wait Until Element Passed Is Visible        ${error_text}
    Element Text Should Be                      ${error_text}       Incorrect username or password entered. Please try again.


