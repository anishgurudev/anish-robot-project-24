*** Settings ***
Library  SeleniumLibrary
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library           Collections
Variables          ../Locators/homePage.py


*** Keywords ***
Select MySpace & tap login button
    Run Keyword until Succeed    Click Element  ${mySpace_tray_Element}
#    Click Element  ${mySpace_tray_Element}
    Wait Until Element Is Visible   ${loginBtn_Element}
    Run Keyword until Succeed    Click Button    ${loginBtn_Element}


Select Search Tab
    Wait Until Element Is Visible  ${search_tray_Element }
    Click Element   ${search_tray_Element }