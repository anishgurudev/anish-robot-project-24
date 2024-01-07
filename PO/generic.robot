*** Settings ***
Library  SeleniumLibrary
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library           Collections


*** Variables ***
${url} =    https://pp5.hotstar.com/
${browser} =    chrome

*** Keywords ***
Open the browser with the Url
    Open Browser    ${url}  ${browser}

Run Keyword until Succeed
    [Arguments]     ${keyword}  @{KeywordArgument}
    Wait Until Keyword Succeeds     5s  1s  ${keyword}  @{KeywordArgument}

Wait Until element located on Page
    Wait Until Element Is Visible        ${Element}

Close Browser session
    Close Browser

