*** Settings ***
Documentation       All page objects/keywords for mainpage page
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../PO/Generic.robot


*** Variables ***
${featured_articles}        css:#bodyContent
${go_to_login_page}         css:#pt-login-2
${watchlist_link}           css:#pt-watchlist-2
${edit_watchlist}           xpath:(//div/span/a/span)[2]


*** Keywords ***

Click Link To Open Login Form
    Wait Until Element Passed Is Visible        ${featured_articles}
    Click Element                               ${go_to_login_page}
