*** Settings ***
Library  SeleniumLibrary
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library           Collections
Variables          ../Locators/searchPage.py


*** Keywords ***


Enter the content & search
   [arguments]     ${Movie_Name}
    sleep   3
    Mouse Over      ${searchbarTxtbox}
    Wait Until Element Is Visible  ${searchbarTxtbox}
    Mouse Over      ${searchbarTxtbox}
    Click Element   ${searchbarTxtbox}
    Input Text      ${searchbarTxtbox}     ${Movie_Name}
    Wait Until Element Is Visible       //*[.='${Movie_Name}']
    Wait Until Element Is Visible   ${watchNowbtn}
    Click Element    ${watchNowbtn}



