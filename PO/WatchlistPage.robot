*** Settings ***
Documentation       All page objects/keywords for watchlist page
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../PO/Generic.robot


*** Variables ***
${watchlist_link}           css:#pt-watchlist-2
${edit_watchlist}           xpath:(//div/span/a/span)[2]
${user_options_dropdown}    css:#vector-user-links-dropdown-checkbox
${logout_button}            css:a[title='Log out']
${confirm_logout}           css:#mw-content-text


*** Keywords ***

Verify Topics Are Saved And Logout

    Click Element                               ${watchlist_link}
    Wait Until Element Passed Is Visible        ${edit_watchlist}
    Click Element                               ${edit_watchlist}
    @{article_titles}=          Get Webelements         xpath://div[@id='ooui-php-6']/div/div/span/label/a

    FOR  ${topic}    IN     @{topic_list}
        Page Should Contain     ${topic}
        Log     ${topic}
    END
    #Log       One element was not found in given list       WARN

    Click Button                                ${user_options_dropdown}
    Sleep       2
    Click Link                                  ${logout_button}
    Wait Until Element Passed Is Visible        ${confirm_logout}
    Page Should Contain                         Log out
