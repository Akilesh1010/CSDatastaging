import string
import re
import xml
import math

def Remove_Whitespace(instring):
    return instring.replace(" ", "")

def listToStringWithoutRoundBrackets(list1):
    return str(list1).replace('(','').replace(' ),','').replace(', )','')

def listToStringWithoutSquareBrackets(list1):
    return str(list1).replace('[','').replace(']','')

def listToStringWithoutcurleeBrackets(list1):
    return str(list1).replace('{','').replace('}','')

def listToStringwithoutcotes(list1):
    return str(list1).replace("'",'')

def listToStringwithoutroundfirstbracket(list1):
    return str(list1).replace("(",'')

def listToStringwithoutroundlastbracket(list1):
    return str(list1).replace(")",'')

#def Removeleadingandtrailingspaces(list1):
 #   return float(list1).strip()

def Removeleadingandtrailingspacesinresult(list1):
    return str(list1).strip()

def Removetrailingspacesinresult(list1):
    return str(list1).rstrip()

def listToStringWithoutdecimal(list1):
    return str(list1).replace('Decimal','')

def listToStringWithoutspace(list1):
    return [x.strip(' ') for x in list1]

def sortthelist(list1):
    return str(list1).sort()

def sort(list1):
    return list1.sort(reverse=True)

def convertLowercaseToUppercase(list1):
    return str(list1).title()

def convertUppercaseToLowercase(list1):
    return str(list1).title()

def capitalize(list1):
    return str(list1).capitalize()


def allUpper(list1):
    return str(list1).upper()


def dividetenlakh(list1):
    return int(list1)/1000000

def divideonecrore(list1):
    return int(list1)/1000000

def dividetenthousand(list1):
    return int(list1)/10000

def getSubstring(list1):
    return str(list1)[9:17]

def roundoff(list1):
    return format(list1, ".2f")

def orderconversion(list1):
    list2 = ['B']
    list3 = ['S']
    list4 = ['LIM']
    list5 = ['MARKET']
    list6 = ['APF']
    list7 = ['GBP']
    list8 = []
    list9 = ['GBX']
    if list1 == list2:
        return str(list1).replace('B', 'BUY')
    if list1 == list3:
        return str(list1).replace('S', 'SELL')
    if list1 == list4:
        return str(list1).replace('LIM','LIMIT')
    if list1 == list6:
        return str(list5)
    if list1 == list7 or list1 == list8:

        return str(list9)

def personEntityconversion(list1):
    return str(list1).replace("GB",'GBR')

def isppsaccountconversion(list1):
    list2 = ['PPS']
    list3 = ['PPI']
    list4 = ['PPP']
    list5 = ['PPB']
    list6 = ['False']

    if list1 == list2:
        return str(list1).replace('PPS', 'true')
    if list1 == list3:
        return str(list1).replace('PPI', 'true')
    if list1 == list4:
        return str(list1).replace('PPP','true')
    if list1 == list5:
        return str(list1).replace('PPB', 'true')
    else:
        return str(list6)

def serviceTypeconversion(list1):

    list2 = ['DIR']
    if list1 == list2:

     return str(list1).replace('DIR' ,'CSD')

def fivespacestoNONE(list1):
    return str(list1).replace("     ",'NONE')

def fundmanagedbyfundmanagerbs(list1):
        return str(list1).replace('sedol:', '').replace('fundManagerID:', '').replace('dateStartedManagingFund:', '').replace('managementType:', '')

def listToStringWithoutcurleeBracketsfuundmanager(list1):
    return str(list1).replace('{','').replace('}',')')

def fundmanagerbs(list1):
     return str(list1).replace('forename:', '').replace('fundManagerID:', '').replace('surname:','').replace('biography:', '')

def getSubstringexchangeRateFromcurrency(list1):
    return str(list1)[0:4]

def getSubstringexchangeRateTocurrency(list1):
    return str(list1)[4:8]

def listToStringwithoutAsterisk(list1):
    return str(list1).replace("*",'')


























