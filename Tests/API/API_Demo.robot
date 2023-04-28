*** Settings ***
Documentation  API Testing in Robot Framework
Library  SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***

*** Test Cases ***
Do a GET Request and validate the response code and response body
    [documentation]  This test case verifies that the response code of the GET Request should be 200,
    ...  the response body contains the 'title' key with value as 'London',
    ...  and the response body contains the key 'location_type'.
    [tags]  Smoke
    Create Session  mysession  https://simple-grocery-store-api.online  verify=true
    ${response}=  GET On Session  mysession  /products/   params=productId=4646
#    https://www.metaweather.com/api/location/search/?query=chicago
    Status Should Be  200  ${response}  #Check Status as 200
    ${category}=  Get Value From Json  ${response.json()}[0]      category
    Log To Console    category[0] is ${category[0]}
    Should Contain   ${category[0]}  coffee