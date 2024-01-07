*** Settings ***
Library  SeleniumLibrary
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library           Collections
Resource          ../PO/loginPage.robot
Resource          ../PO/generic.robot
Resource          ../PO/homePage.robot
Resource          ../PO/playerPage.robot
Resource          ../PO/searchPage.robot

*** Variables ***

${validMobileNo}=   9234870894
${validOTP} =       1234



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

Validate Player controls
   Open the browser with the Url
   Set Selenium Implicit Wait  10 seconds  # playing with implicit waits
   Login into the hotstar    ${validMobileNo}    ${validOTP}
#    Select Search Tab
#   Enter the content & search      ${MovieName}
#   validate the content title in player
#    Pause the player & Forward the content
#   Close Browser session


*** Keywords ***

Logout from the appliction
    select mySpace
    click help&settings
    click logout button
    select the logout option from the popup box

Logout from the other devices
    select mySpace
    click help&settings



Pause the player & Forward the content

    Wait Until Page Contains Element    //*[@class='oMSW6l4Y23kO6ZaD67dCu']
    Mouse up    //*[@class='oMSW6l4Y23kO6ZaD67dCu']
    Click Element   //*[@class='oMSW6l4Y23kO6ZaD67dCu']
    Click Element   //*[@class='oMSW6l4Y23kO6ZaD67dCu']
    sleep    2s
    Wait Until Page Contains Element    //div[@aria-label='Current position']
    Scroll Element Into View    //div[@aria-label='Current position']
 #   Drag And Drop By Offset    //div[@aria-label='Current position']         40       846
    Click Element   ${SBpausebtn}
#    Wait Until Element Is Visible   //*[@class="icon-pause-fill soul-icon ON_SURFACE_DEFAULT ICON_FONTSIZE_07"]/..
#   Wait Until Element Is Enabled   //*[@class="icon-pause-fill soul-icon ON_SURFACE_DEFAULT ICON_FONTSIZE_07"]/..
    Run Keyword until Succeed   Click Element  //div[@aria-label='Current position']
    sleep   2s
     Run Keyword until Succeed   Click Element  ${playerForwardIcon}
     Run Keyword until Succeed   Click Element  ${playerForwardIcon}
     Run Keyword until Succeed   Click Element  ${SBpausebtn}
     sleep   2s
     Run Keyword until Succeed   Click Element  ${playerBackbtn}
     Click Element At Coordinates
     Drag And Drop By Offset




