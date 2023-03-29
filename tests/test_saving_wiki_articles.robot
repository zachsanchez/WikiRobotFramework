*** Settings ***
Documentation   To validate the Login form
Library         SeleniumLibrary     timeout= 20s
Library         ../custom_libs/Search.py
Test Setup      Open Browser With url
Test Teardown   Close Browser Session
Resource        ../PO/Generic.robot
Resource        ../PO/LanguagePage.robot
Resource        ../PO/MainPage.robot
Resource        ../PO/LoginPage.robot
Resource        ../PO/WatchlistPage.robot


*** Variables ***
${language_choice}      English
${error_message}        css:.mw-message-box-error.mw-message-box



*** Test Cases ***

Verify Unsuccessful Login
    [Tags]      SMOKE
    LanguagePage.Validate And Select Available Language      ${language_choice}
    MainPage.Click Link To Open Login Form
    LoginPage.Fill The Login Form And Submit                 ${user_name}           ${invalid_pass}
    LoginPage.Verify Error Message Is Correct                ${error_message}

End To End Topic Search/Bookmark Validation
    [Tags]    REGRESSION
    LanguagePage.Validate And Select Available Language      ${language_choice}
    MainPage.Click Link To Open Login Form
    LoginPage.Fill The Login Form And Submit                 ${user_name}           ${valid_pass}
    Search Topics And Save To Watchlist                      ${topic_list}
    WatchlistPage.Verify Topics Are Saved And Logout

