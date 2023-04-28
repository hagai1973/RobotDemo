*** Settings ***
Documentation       Robot Framework XML examples.
Library             XML    use_lxml=True


*** Variables ***
#${XML_FILE_PATH}=       ${CURDIR}${/}robots.xml
${XML_FILE_PATH}=       robots.xml
${element} =            ${EMPTY}


#robot -d .\Results\  -N "XML Demo tests"   ./Tests/XML/XML_Demo.robot

*** Test Cases ***
Get elements from XML by XPath
    ${xml}=    Parse test XML
    ${elements}=    Get Elements    ${xml}    //robot
    FOR    ${element}    IN    @{elements}
        Log Element    ${element}
    END


Verify first name in XML
    ${xml}=    Parse test XML
    ${nick-name} =      get element text        ${xml}          .//robot[@id='MK-I']//nick-name
    log to console          nick name is:${nick-name}
    should be equal as strings             Spider               ${nick-name}



*** Keywords ***
Parse test XML
    ${xml}=    Parse Xml    ${XML_FILE_PATH}
    RETURN    ${xml}