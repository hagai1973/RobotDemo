*** Settings ***
Library         OperatingSystem
Default Tags        demo

*** Variables ***
${PATH}         ${CURDIR}/example.txt

*** Test Cases ***
Test 1
    Create File          ${PATH}    I really love watching the sunset in the evening.
    File Should Exist    ${PATH}
    Copy File            ${PATH}    file.txt


Test 2
    ${string}   get file     ${PATH}
    should contain  ${string}   love