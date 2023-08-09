*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    OperatingSystem
Resource    ./configurations.robot

*** Keywords ***
Setup Suite Screenshot Directory
    ${timestamp}    Get Current Date    result_format=%Y-%m-%d-%H:%M:%S
    Set Suite Variable    ${timestamp}
    Create Directory    ${EXECDIR}/screenshots/${timestamp}

Setup Screenshot Directory
    Create Directory    ${EXECDIR}/screenshots/${timestamp}/${TEST_NAME}
    Set Screenshot Directory    ${EXECDIR}/screenshots/${timestamp}/${TEST_NAME}

Open Kabum Website
    Log    Starting login process
    Open Browser    https://www.kabum.com.br/    chrome    options=${BROWSER_OPTIONS}
    Capture Page Screenshot

Login With Credentials
    [Arguments]    ${name}    ${email}
    Click Element    id=linkLoginHeader
    Input Text    xpath=//label[contains(text(),'E-mail')]/../input    ${name}
    Input Text    xpath=//label[contains(text(),'Senha')]/../input    ${email}
    Capture Page Screenshot
    Click Element    css=[type=submit]

Validate Error Message
    Wait Until Element Is Visible    css=div div:nth-child(4) p
    Capture Page Screenshot
    Element Should Contain    css=div div:nth-child(4) p    ${ERROR_MSG}

Fill Search Field
    [Arguments]    ${product}
    Input Text    id=input-busca    ${product}
    Capture Page Screenshot

Click Search Button
    Click Element    css=form[action="/busca"] button[type="submit"]

Verify Items Result
    ${actual_count}    Get Element Count    css=h2 span
    Capture Page Screenshot
    Should Be True    ${actual_count} > 1

Verify Item Title Contains Product
    [Arguments]    ${product}
    ${actual_text}    Get Text    css=main > div:nth-child(1) > a > div > button > div > h2 > span
    Capture Page Screenshot
    Should Contain    ${actual_text}    ${product}

Select Item Department
    Click Element    xpath=//span[contains(text(),'DEPARTAMENTOS')]
    Capture Page Screenshot
    Click Element      xpath=//a[contains(text(),'Benefício')]
    Capture Page Screenshot


Click Buy Button
    Capture Page Screenshot
    Click Element    xpath=//div[2]/button[contains(text(),'COMPRAR')]

Verify Item Added Alert
    Wait Until Element Is Visible    css=#__next > div > div > div > div > div > div:nth-child(2) > strong
    ${actual_text}    Get Text    css=#__next > div > div > div > div > div > div:nth-child(2) > strong
    Capture Page Screenshot
    Should Contain    ${actual_text}    ${ALERT}


Verify Item on Cart
    [Arguments]    ${product}
    Go To    https://www.kabum.com.br/carrinho
    Wait Until Element Is Visible    css=#sellersContainer > div > div > div > div > div > div > div > div > a
    Element Should Contain    css=#sellersContainer > div > div > div > div > div > div > div > div > a    ${product}

    