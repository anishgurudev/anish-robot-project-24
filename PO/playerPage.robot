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
${MovieName} =       Sanak
${MovieName_element} =  //*[.='Sanak']

*** Keywords ***
validate the content title in player
    Wait Until Element Is Visible    ${MovieName_element}
    Page Should Contain Element     ${MovieName_element}
    Page Should Contain     ${MovieName}
    sleep   5s