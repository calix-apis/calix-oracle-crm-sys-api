%dw 2.0
output application/xml
ns ns0 http://xmlns.oracle.com/apps/cdm/foundation/parties/customerAccountService/applicationModule/types/
ns ns01 http://xmlns.oracle.com/adf/svc/types/
---
{
	ns0#findCustomerAccount: {
		ns0#findCriteria: {
			ns01#fetchStart: p('soap.find-customer.fetch-start'),
			ns01#fetchSize: p('soap.find-customer.fetch-size'),
			ns01#filter: {
				ns01#group: {
					ns01#upperCaseCompare: p('soap.find-customer.upper-case-compare'),
					ns01#item: {
						ns01#upperCaseCompare: p('soap.find-customer.upper-case-compare'),
						ns01#attribute: p('soap.find-customer.attribute'),
						ns01#operator: p('soap.find-customer.attribute'),
						ns01#value: vars.InputData.customerAccountId
					}
				}
			},
			ns01#excludeAttribute: p('soap.find-customer.exclude-attribute')
		},
		ns0#findControl: {
			ns01#retrieveAllTranslations: p('soap.find-customer.retrieve-all-translations')
		}
	}
}