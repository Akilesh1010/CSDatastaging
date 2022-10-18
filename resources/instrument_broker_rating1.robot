*** Settings ***
Documentation       Instrument Broker Ratings Keywords
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
##Variables      ../common/brokerrating.py
Resource    ../common/graphql.robot
Resource    ../common/instrument_broker_rating_variable.robot
Library    ../common/readexcel.py
Resource   ../common/Read_excel.robot

*** Keywords ***
Broker rating service

    FOR   ${k}    IN RANGE   0     1
    ${xpars1}=   Get from list   ${xpars}   ${k}
    ${broker_name}=      Get Value From Json     ${xpars1}     $.broker_rec_feed.broker_rec_data.broker_rec[0:].broker_name
    ${broker_action_text}=      Get Value From Json     ${xpars1}     $.broker_rec_feed.broker_rec_data.broker_rec[0:].broker_action_text
    ${broker_recommendation_text}=      Get Value From Json     ${xpars1}    $.broker_rec_feed.broker_rec_data.broker_rec[0:].broker_recommendation_text
    ${price}=      Get Value From Json     ${xpars1}    $.broker_rec_feed.broker_rec_data.broker_rec[0:].price
    ${old_price_target}=     Get Value From Json     ${xpars1}     $.broker_rec_feed.broker_rec_data.broker_rec[0:].old_price_target
    ${new_price_target}=    Get Value From Json     ${xpars1}    $.broker_rec_feed.broker_rec_data.broker_rec[0:].new_price_target

    END
    @{WebFG_service_list_to_price}  Create List  #   create empty list to populate with for-loop
    @{WebFG_service_list_to_old_price_target}  Create List
    @{WebFG_service_list_to_new_price_target}  Create List
    ${price_cnt}=    Get length    ${price}
    ${old_price_target_cnt}=    Get length    ${old_price_target}
    ${new_price_target_cnt}=    Get length    ${new_price_target}
    FOR  ${i}  IN RANGE  0  ${price_cnt}
    ${x}=   Get from list  ${price}     ${i}
    ${b}=   Evaluate   math.ceil(${num}*${x})
    Append To List  ${WebFG_service_list_to_price}  ${b}
    END
    FOR  ${i}  IN RANGE  0  ${${old_price_target_cnt}}
    ${x}=   Get from list  ${old_price_target}  ${i}
    ${b}=   Evaluate   math.ceil(${num}*${x})
    Append To List  ${WebFG_service_list_to_old_price_target}  ${b}
    END
    FOR  ${i}  IN RANGE  0  ${${new_price_target_cnt}}
    ${x}=   Get from list  ${new_price_target}  ${i}
    ${b}=   Evaluate   math.ceil(${num}*${x})
    Append To List  ${WebFG_service_list_to_new_price_target}  ${b}
    END


    FOR   ${j}    IN RANGE   0     1
    ${gpql_json_data1}=   Get from list   ${gpql_json_data}   ${j}
    ${gpql_broker_name}=      Get Value From Json    ${gpql_json_data1}  $.data.instrument.nodes[0].instrumentBrokerRatings[0:].broker

    ${gpql_broker_action_text}=      Get Value From Json     ${gpql_json_data1}   $.data.instrument.nodes[0].instrumentBrokerRatings[0:].recommendation

    ${gpql_broker_recommendation_text}=      Get Value From Json    ${gpql_json_data1}   $.data.instrument.nodes[0].instrumentBrokerRatings[0:].change

    ${gpql_price}=      Get Value From Json    ${gpql_json_data1}   $.data.instrument.nodes[0].instrumentBrokerRatings[0:].price

    ${gpql_oldTargetPrice}=      Get Value From Json    ${gpql_json_data1}   $.data.instrument.nodes[0].instrumentBrokerRatings[0:].oldTargetPrice

    ${gpql_newTargetPrice}=      Get Value From Json    ${gpql_json_data1}   $.data.instrument.nodes[0].instrumentBrokerRatings[0:].newTargetPrice

    END

    @{list_to_gpql_price}  Create List  #   create empty list to populate with for-loop
    @{list_to_gpql_oldTargetPrice}  Create List
    @{list_to_gpql_newTargetPrice}  Create List

    ${gpl_price_cnt}=    Get length    ${gpql_price}
    ${gpl_old_price_target_cnt}=    Get length    ${gpql_oldTargetPrice}
    ${gpl_new_price_target_cnt}=    Get length    ${gpql_newTargetPrice}

    FOR  ${i}  IN RANGE  0  ${gpl_price_cnt}
    ${x}=   Get from list  ${gpql_price}     ${i}
    ${b}=   Evaluate   math.ceil(${x})
    Append To List  ${list_to_gpql_price}  ${b}
    END

    FOR  ${i}  IN RANGE  0  ${old_price_target_cnt}
    ${x}=   Get from list   ${gpql_oldTargetPrice}     ${i}
    ${b}=   Evaluate   math.ceil(${x})
    Append To List  ${list_to_gpql_oldTargetPrice}  ${b}
    END

    FOR  ${i}  IN RANGE  0  ${gpl_new_price_target_cnt}
    ${x}=   Get from list  ${gpql_newTargetPrice}     ${i}
    ${b}=   Evaluate   math.ceil(${x})
    Append To List  ${list_to_gpql_newTargetPrice}  ${b}
    END


    FOR   ${k}    IN RANGE   1     3
    ${xpars1}=   Get from list   ${xpars}   ${k}
    ${broker_name_na}=      Get Value From Json     ${xpars1}     $.broker_rec_feed.broker_rec_data.broker_rec[0:].broker_name
    ${broker_action_text_na}=      Get Value From Json     ${xpars1}     $.broker_rec_feed.broker_rec_data.broker_rec[0:].broker_action_text
    ${broker_recommendation_text_na}=      Get Value From Json     ${xpars1}    $.broker_rec_feed.broker_rec_data.broker_rec[0:].broker_recommendation_text
    ${price_na}=      Get Value From Json     ${xpars1}    $.broker_rec_feed.broker_rec_data.broker_rec[0:].price
    ${old_price_target_na}=     Get Value From Json     ${xpars1}     $.broker_rec_feed.broker_rec_data.broker_rec[0:].old_price_target
    ${new_price_target_na}=    Get Value From Json     ${xpars1}    $.broker_rec_feed.broker_rec_data.broker_rec[0:].new_price_target

    END

    FOR   ${l}    IN RANGE   1     3
    ${gpql_json_data1}=   Get from list   ${gpql_json_data}   ${l}
    ${gpql_broker_name_null}=      Get Value From Json    ${gpql_json_data1}  $.data.instrument.nodes[0].instrumentBrokerRatings[0:].broker

    ${gpql_broker_action_text_null}=      Get Value From Json     ${gpql_json_data1}   $.data.instrument.nodes[0].instrumentBrokerRatings[0:].recommendation

    ${gpql_broker_recommendation_text_null}=      Get Value From Json    ${gpql_json_data1}   $.data.instrument.nodes[0].instrumentBrokerRatings[0:].change

    ${gpql_price_null}=      Get Value From Json    ${gpql_json_data1}   $.data.instrument.nodes[0].instrumentBrokerRatings[0:].price

    ${gpql_oldTargetPrice_null}=      Get Value From Json    ${gpql_json_data1}   $.data.instrument.nodes[0].instrumentBrokerRatings[0:].oldTargetPrice

    ${gpql_newTargetPrice_null}=      Get Value From Json    ${gpql_json_data1}   $.data.instrument.nodes[0].instrumentBrokerRatings[0:].newTargetPrice

    END


    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${broker_name}   ${gpql_broker_name}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${broker_name}
    log     ${gpql_broker_name}
    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${broker_action_text}  ${gpql_broker_action_text}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${broker_action_text}
    log     ${gpql_broker_action_text}
    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings      ${broker_recommendation_text}   ${gpql_broker_recommendation_text}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${broker_recommendation_text}
    log     ${gpql_broker_recommendation_text}
    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings      ${WebFG_service_list_to_price}     ${list_to_gpql_price}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${WebFG_service_list_to_price}
    log     ${list_to_gpql_price}
    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings      ${WebFG_service_list_to_old_price_target}   ${list_to_gpql_oldTargetPrice}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${WebFG_service_list_to_old_price_target}
    log     ${list_to_gpql_oldTargetPrice}
    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${WebFG_service_list_to_new_price_target}   ${list_to_gpql_newTargetPrice}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${WebFG_service_list_to_new_price_target}
    log     ${list_to_gpql_newTargetPrice}


    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${broker_name_na}   ${gpql_broker_name_null}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${broker_name_na}
    log     ${gpql_broker_name_null}
    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${broker_action_text_na}  ${gpql_broker_action_text_null}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${broker_action_text_na}
    log     ${gpql_broker_action_text_null}
    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings      ${broker_recommendation_text_na}   ${gpql_broker_recommendation_text_null}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${broker_recommendation_text_na}
    log     ${gpql_broker_recommendation_text_null}
    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings      ${price_na}     ${gpql_price_null}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${price_na}
    log     ${gpql_price_null}
    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings      ${old_price_target_na}   ${gpql_oldTargetPrice_null}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${old_price_target_na}
    log     ${gpql_oldTargetPrice_null}
    ${passed}  ${value}  RUN KEYWORD And Ignore error  Should Be Equal As Strings       ${new_price_target_na}   ${gpql_newTargetPrice_null}
    RUN KEYWORD IF  "${passed}" == "FAIL"  run keyword And Continue on failure    FAIL
    log     ${new_price_target_na}
    log     ${gpql_newTargetPrice_null}
















