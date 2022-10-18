*** Variables ***
${Figaro_RESTAPI_GET_individual_base_url}   http://figaroapicsu.charles-stanley.co.uk/latest
${Figaro_RESTAPI_rel_url}    /individual/00000546572?include=relatedaccounts
${Gql_legal_entity_RESTAPI_individual}  query {legalEntity (personId: "00000546572"){nodes{legalEntityAccountRelationships{ personId accountNumber legalEntityRelationshipCode tradingAllowed viewingAllowed}}}}

${Grapghql_base_url}    http://datastaging1-sit.charles-stanley.co.uk