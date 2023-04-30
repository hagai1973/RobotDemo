*** Settings ***
Suite Setup       Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
Suite Teardown    Disconnect From Database
Library           DatabaseLibrary
Library           OperatingSystem
Library           Collections


*** Variables ***
${DBHost}         localhost
${DBName}         travis_ci_test
${DBPass}         ""
${DBPort}         5432
${DBUser}         postgres

*** Test Cases ***
Create person table
    ${output} =    Execute SQL String    CREATE TABLE person (id integer unique,first_name varchar,last_name varchar);
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Execute SQL Script - Insert Data person table
    Comment    ${output} =    Execute SQL Script    ./${DBName}_insertData.sql
    ${output} =    Execute SQL Script    ./my_db_test_insertData.sql
    Log    ${output}
    Should Be Equal As Strings    ${output}    None