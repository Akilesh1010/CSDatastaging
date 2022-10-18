*** Settings ***
Documentation       Legal entity relationship type
Library    SoapLibrary
Library    Collections
Library     XML
Library             OperatingSystem
Library             SeleniumLibrary
Library             pyodbc
Library             Collections
Library             RequestsLibrary
Library             JSONLibrary
Library             OperatingSystem
Library             string
Library     DatabaseLibrary
Library     ../common/common.py
Resource    ../common/legalentityrelationshiptype_variable.robot
Resource    ../common/graphql.robot
*** Keywords ***
Legal entity relationship type
    ${gpql_json_data0}=   Get from list   ${gpql_json_data}  0
    ${gpql_relationshipCode_value}=     Get Value From Json     ${gpql_json_data0}      $.data.legalEntity.nodes[0].legalEntityAccountRelationships[0].legalEntityRelationshipCodeNavigation.relationshipCode
    ${gpql_relationshipDescription_value}=     Get Value From Json     ${gpql_json_data0}      $.data.legalEntity.nodes[0].legalEntityAccountRelationships[0].legalEntityRelationshipCodeNavigation.relationshipDescription
    ${gpql_relationshipType_value}=     Get Value From Json     ${gpql_json_data0}      $.data.legalEntity.nodes[0].legalEntityAccountRelationships[0].legalEntityRelationshipCodeNavigation.relationshipType
    ${gpql_clientAllowed_value}=     Get Value From Json     ${gpql_json_data0}      $.data.legalEntity.nodes[0].legalEntityAccountRelationships[0].legalEntityRelationshipCodeNavigation.clientAllowed
    ${gpql_nonClientAllowed_value}=     Get Value From Json     ${gpql_json_data0}      $.data.legalEntity.nodes[0].legalEntityAccountRelationships[0].legalEntityRelationshipCodeNavigation.nonClientAllowed

    ${RelationshipTypeCode}   Get Variable Value    ${RelationshipTypeCode_to_list}
    ${RelationshipDescription}   Get Variable Value    ${RelationshipDescription_to_list}
    ${RelationshipType}   Get Variable Value    ${RelationshipType_to_list}
    ${ClientAllowed}   Get Variable Value    ${ClientAllowed_to_list}
    ${NonClientAllowed}   Get Variable Value    ${NonClientAllowed_to_list}

    ${gpql_relationshipCode_value1}   Get from list   ${gpql_relationshipCode_value}    0
    ${gpql_relationshipDescription_value1}   Get from list   ${gpql_relationshipDescription_value}    0
    ${gpql_relationshipType_value1}  Get from list   ${gpql_relationshipType_value}    0
    ${gpql_clientAllowed_value1}     Get from list   ${gpql_clientAllowed_value}    0
    ${gpql_nonClientAllowed_value1}  Get from list   ${gpql_nonClientAllowed_value}    0

     list should contain value      ${RelationshipTypeCode}    ${gpql_relationshipCode_value1}
     log    ${RelationshipTypeCode}
     log    ${gpql_relationshipCode_value1}

     list should contain value      ${RelationshipDescription}    ${gpql_relationshipDescription_value1}
     Log    ${RelationshipDescription}
     log    ${gpql_relationshipDescription_value1}
     list should contain value      ${RelationshipType}    ${gpql_relationshipType_value1}
     log    ${RelationshipType}
     log    ${gpql_relationshipType_value1}
     list should contain value      ${ClientAllowed}    ${gpql_clientAllowed_value1}
     log  ${ClientAllowed}
     log  ${gpql_clientAllowed_value1}

     list should contain value      ${NonClientAllowed}    ${gpql_nonClientAllowed_value1}
     log  ${NonClientAllowed}
     Log  ${gpql_nonClientAllowed_value1}









