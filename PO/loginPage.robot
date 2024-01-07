*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library           Collections
Resource          ../PO/homePage.robot
Variables         ../Locators/loginPage.py


*** Keywords ***
Login into the hotstar
   [arguments]     ${mob_no}     ${otp}
   Select MySpace & tap login button
   Fill the mobile no & tap on get OTP      ${mob_no}
   Enter OTP & tap continue     ${otp}
   Select profile


Fill the mobile no & tap on get OTP
   [arguments]     ${mob_no}
    Wait Until Element Is Visible    ${mobileNo_txtbox_Element}
    Mouse Over      ${mobileNo_txtbox_Element}
    Input Text      ${mobileNo_txtbox_Element}       ${mob_no}
    Click Button    ${getOTPBtn_Element}

Enter OTP & tap continue
   [arguments]     ${otp}
   Wait Until Element Is Visible   ${Otp_txtbox_Element}
     ${otplist} =     Convert To List     ${otp}
      ${index}=   Set Variable    1
       FOR  ${i}      IN      @{otplist}
         Log  ${i}
         Wait Until Element Is Visible    ${index}
         Input Text     ${index}     ${i}
         ${index}=  Evaluate   ${index} + 1
        END
   Click Button    ${continueBtn_Element}

Select profile
    Wait Until Element Is Visible    //p[text()='anish']/..
    Run Keyword until Succeed   Click Element   //p[text()='anish']


