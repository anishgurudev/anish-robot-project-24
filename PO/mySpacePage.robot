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



Select MySpace & tap LogOut button
    Run Keyword until Succeed   Click Element  ${mySpace_tray_Element}
    Run Keyword until Succeed   Click Element  ${helepSettingbtn_Element}
    Run Keyword until Succeed   Click Element   ${logOutbtn_Element}
    Wait Until element located on Page      ${logOutbtn_popUp_Element}
    Run Keyword until Succeed   Click Element  ${logOutbtn_popUp_Element}  # select the logout option from the popup box
