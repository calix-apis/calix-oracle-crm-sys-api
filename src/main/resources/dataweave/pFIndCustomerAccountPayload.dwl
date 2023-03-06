%dw 2.0
output application/xml
ns ns0 http://xmlns.oracle.com/apps/cdm/foundation/parties/customerAccountService/applicationModule/types/
ns ns01 http://xmlns.oracle.com/adf/svc/types/
---
{
	ns0#findCustomerAccount: {
		ns0#findCriteria: {
			ns01#fetchStart: 0,
			ns01#fetchSize: -1,
			ns01#filter: {
				ns01#group: {
					ns01#upperCaseCompare: false,
					ns01#item: {
						ns01#upperCaseCompare: false,
						ns01#attribute: "OrigSystemReference",
						ns01#operator: "=",
						ns01#value: vars.inputData.customerAccountId default ""
					},
					ns01#item: {
						ns01#conjunction: "Or",
						ns01#attribute: "OriginalSystemReference",
						ns01#nested: {
							ns01#group: {
								ns01#item: {
								ns01#attribute: "OrigSystemReference",
								ns01#operator: "=",
								ns01#value: vars.inputData.customerAccountId default ""
							}
						}
					}
				}
			}
		},
		ns01#excludeAttribute: false
	},
	ns0#findControl: {
		ns01#retrieveAllTranslations: true
	}
}
}