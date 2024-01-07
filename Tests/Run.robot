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
${mySpace_tray_Element} =  //a[contains(.,'My Space')]/..
${loginBtn_Element} =   //button[@type='button'][contains(.,'Log In')]
${mobileNo_txtbox_Element} =    //*[@title='Phone number']
${getOTPBtn_Element} =      //button[@type='submit']
${Otp_txtbox_Element} =     //input[@id='1']
${continueBtn_Element} =    //button[@type='submit']
${validMobileNo}=   9234870894
${validOTP} =       1234
${phElemt} =        //p[@class=' ON_SURFACE_DEFAULT BODY2_MEDIUM ']
${profile_tray_Element} =     //h2[contains(.,'Profiles')]
${search_tray_Element } =    //a[contains(.,'Search')]/..
${home_tray_Element } =    //a[contains(.,'Home')]/..
${helepSettingbtn_Element } =    //a[contains(.,'Help & Support')]/..
${searchbarTxtbox} =     searchBar
${watchNowbtn} =   //span[.='Watch Now']
${seekbaarbtn} =    //div[@aria-label='Current position']
${SBplaybtn} =   .icon-play-fill
${SBpausebtn} =     .icon-pause-fill
${seekbaartime} =   //span[@class=' ON_IMAGE LABEL_CAPTION1_SEMIBOLD ']
${playerBackbtn} =   .icon-arrow-back
${playerHighVolumeIcon}=    .icon-volume-high-line
${playerLowVolumeIcon}=    .icon-volume-low-line
${playerMuteVolumeIcon}=    .icon-volume-off-line
${playerForwardIcon}=       .icon-forward-line
${playerBackwardIcon}=      .icon-back-line






*** Test Cases ***

Validate Succesful Login
   Open the browser with the Url
   Login into the hotstar
#  Validate the countrycode with no is present in MySpace
#  Close Browser session

#Validate plability of Content
 #  Open the browser with the Url
#   Login into the hotstar
#    Select Search Tab
 #   Enter the content & search
 #   validate the content title
#    Pause the player & Forward the content
#   Close Browser session

*** Keywords ***
Open the browser with the Url
    Open Browser    ${url}  ${browser}
#    Maximize Browser Window

Close Browser session
    Close Browser

Select MySpace & tap login button
    Run Keyword until Succeed    Click Element  ${mySpace_tray_Element}
    Click Element  ${mySpace_tray_Element}
    Wait Until Element Is Visible   ${loginBtn_Element}
    Run Keyword until Succeed    Click Button    ${loginBtn_Element}

Fill the mobile no & tap on get OTP
    Wait Until Element Is Visible    ${mobileNo_txtbox_Element}
    Mouse Over      ${mobileNo_txtbox_Element}
    Input Text      ${mobileNo_txtbox_Element}       ${validMobileNo}
    Click Button    ${getOTPBtn_Element}

Enter OTP & tap continue
   Wait Until Element Is Visible   ${Otp_txtbox_Element}
     ${otplist} =     Convert To List     ${validOTP}
      ${index}=   Set Variable    1
       FOR  ${i}      IN      @{otplist}
         Log  ${i}
         Wait Until Element Is Visible    ${index}
         Input Text     ${index}     ${i}
         ${index}=  Evaluate   ${index} + 1
        END
   Click Button    ${continueBtn_Element}

Wait Until element located on Page
    Wait Until Element Is Visible        ${Element}

Validate the countrycode with no is present in MySpace
   Wait Until Element Is Visible     ${phElemt}
   Page Should Contain Element      ${phElemt}
   Wait Until Element Is Visible     ${profile_tray_Element}
   Page Should Contain Element      ${profile_tray_Element}
   Page Should Contain     91
   Page Should Contain     Profile



Select Search Tab
    Wait Until Element Is Visible  ${search_tray_Element }
    Click Element   ${search_tray_Element }

Enter the content & search
    Wait Until Element Is Visible  ${searchbarTxtbox}
    Mouse Over      ${searchbarTxtbox}
    Click Element   ${searchbarTxtbox}
    Input Text      ${searchbarTxtbox}     Sanak
    Wait Until Element Is Visible       //*[.='Sanak']
#    Wait Until Element Is Visible   ${watchNowbtn}
    Click Element    ${watchNowbtn}

validate the content title
    Wait Until Element Is Visible    //*[.='Sanak']
    Page Should Contain Element     //*[.='Sanak']
    Page Should Contain     Sanak
    sleep   5s

Pause the player & Forward the content
    Click Element At Coordinates
    Drag And Drop By Offset
    Wait Until Page Contains Element
    sleep 2s
#    Wait Until Element Is Visible   //*[@class="icon-pause-fill soul-icon ON_SURFACE_DEFAULT ICON_FONTSIZE_07"]/..
#   Wait Until Element Is Enabled   //*[@class="icon-pause-fill soul-icon ON_SURFACE_DEFAULT ICON_FONTSIZE_07"]/..
    Mouse up  //*[@class="icon-pause-fill soul-icon ON_SURFACE_DEFAULT ICON_FONTSIZE_07"]/..
    Run Keyword until Succeed   Click Element  ${SBpausebtn}
    sleep   2s
     Run Keyword until Succeed   Click Element  ${playerForwardIcon}
     Run Keyword until Succeed   Click Element  ${playerForwardIcon}
     Run Keyword until Succeed   Click Element  ${SBpausebtn}
     sleep   2s
     Run Keyword until Succeed   Click Element  ${playerBackbtn}










Run Keyword until Succeed
    [Arguments]     ${keyword}  @{KeywordArgument}
    Wait Until Keyword Succeeds     5s  1s  ${keyword}  @{KeywordArgument}


Login into the hotstar
#   [arguments]     ${username}     ${password}
   Select MySpace & tap login button
   Fill the mobile no & tap on get OTP
   Enter OTP & tap continue
   Select profile

Select profile
    Wait Until Element Is Visible    //p[text()='anish']/..
    Run Keyword until Succeed   Click Element   //p[text()='anish']
