*** Variables ***
@{Figaro_RESTAPI_GET_individual_attribute}         personCode
##...     formal
##...     name
...     title
...     forename
...     surname
...     postcode
...     address
...     iso3
##...     countryOfBirth.iso3
##...     townOfBirth
##...     dob

@{Figaro_RESTAPI_GET_individual_Xpath}  .
##...     ./salutation
##...     .
...     .
...     .
...     .
...     .//address
...     ./emailAddress
...     ./residence
##...     .

@{GQL_legal_entity_RESTAPI_GET_individual_attribute}      personId
##...             salutation
##...             fullName
...             title
...             forename
...             surname
...             postCode
...             emailAddress
...             countryOfResidence
##...             countryOfBirth
##...             placeOfBirth
##...             dateOfBirth


@{Figaro_RESTAPI_GET_individual_element_text}   .//addressLine[1]
...     .//addressLine[2]
...     .//addressLine[3]
...     .//addressLine[4]
...     .//addressLine[5]

@{GQL_legal_entity_RESTAPI_GET_individual_attribute_txt}    addressLine1
...             addressLine2
...             addressLine3
...             addressLine4
...             addressLine5