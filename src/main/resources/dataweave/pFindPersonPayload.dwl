%dw 2.0
output application/xml
ns ns0 http://xmlns.oracle.com/apps/cdm/foundation/parties/personService/applicationModule/types/
ns ns01 http://xmlns.oracle.com/adf/svc/types/
---
{
	ns0#findPerson: {
		ns0#findCriteria: {
			ns01#fetchStart:p('soap.find-person.fetch-start'),
			ns01#fetchSize: p('soap.find-person.fetch-size'),
			ns01#filter: {
				ns01#group: {
					ns01#upperCaseCompare:p('soap.find-person.upper-case-compare'),
					ns01#item: {
						ns01#upperCaseCompare: p('soap.find-person.upper-case-compare'),
						ns01#attribute: p('soap.find-person.attribute'),
						ns01#operator: p('soap.find-person.operator'),
						ns01#value: vars.inputData.partyId
					}
				}
			}
		}
	}
}