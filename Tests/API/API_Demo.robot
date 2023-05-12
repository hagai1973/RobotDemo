*** Settings ***
Documentation  API Testing in Robot Framework
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Default Tags        demo

*** Variables ***



*** Test Cases ***
Do a GET Request and validate the response code and response body
    [documentation]  This test case verifies that the response code of the GET Request should be 200,
    ...  the response body contains the 'category[0]' key with value as 'coffee',
    [tags]  Smoke
    Create Session  mysession  https://simple-grocery-store-api.online  verify=true
    ${response}=  GET On Session  mysession  /products/   params=productId=4646
#    https://www.metaweather.com/api/location/search/?query=chicago
    Status Should Be  200  ${response}  #Check Status as 200
    ${category}=  Get Value From Json  ${response.json()}[0]      category
    Log To Console    category[0] is ${category[0]}
    Should Contain   ${category[0]}  coffee