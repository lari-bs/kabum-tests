*** Settings ***
Resource    resources/keywords.robot
Suite Setup    Setup Suite Screenshot Directory
Test Setup    Setup Screenshot Directory
Test Teardown    Close All Browsers

*** Test Cases ***
Login Test
    Open Kabum Website
    Login With Credentials    ${INVALID_EMAIL}    ${INVALID_PASSWORD}
    Validate Error Message

Search Product
    Open Kabum Website
    Fill Search Field    ${PRODUCT}
    Click Search Button
    Verify Items Result
    Verify Item Title Contains Product    ${PRODUCT}

Purchase Product
    Open Kabum Website
    Select Item Department
    Verify Item Title Contains Product    ${PRIME_PRODUCT}
    Click Buy Button
    Verify Item Added Alert
    Verify Item on Cart    ${PRIME_PRODUCT}