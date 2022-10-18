*** Variables ***
@{Figaro_RESTAPI_GET_individual_attribute}  personCode
...             accountCode
...             relationshipTypeCode
...             authorityTypeCode
...             authorityTypeCode


@{Figaro_RESTAPI_GET_individual_Xpath}      .
...     .//accountCode
...     .//relationshipTypeCode
...     .//authorityTypeCode
...     .//authorityTypeCode


@{GQL_legal_entity_RESTAPI_GET_individual_attribute}    personId
...             accountNumber
...             legalEntityRelationshipCode
...             tradingAllowed
...             viewingAllowed


