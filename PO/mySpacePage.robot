*** Settings ***
Library  SeleniumLibrary
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library           Collections
Variables         ../Locators/mySpacePage.py


*** Keywords ***
Validate the countrycode with no is present in MySpace
   Wait Until Element Is Visible     ${phElemt}
   Page Should Contain Element      ${phElemt}
   Wait Until Element Is Visible     ${profile_tray_Element}
   Page Should Contain Element      ${profile_tray_Element}
   Page Should Contain     91
   Page Should Contain     Profile