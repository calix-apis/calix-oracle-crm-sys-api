%dw 2.0
output application/xml
ns ns0 http://xmlns.oracle.com/apps/cdm/foundation/parties/customerAccountService/applicationModule/types/
ns ns01 http://xmlns.oracle.com/apps/cdm/foundation/parties/customerAccountService/
---
{
	ns0#mergeCustomerAccount: {
		ns0#customerAccount: {
			ns01#CustomerAccountId: vars.InputData.customerAccountId,
			ns01#PartyId: vars.InputData.salesforceContactId,
			ns01#CustomerAccountContact: {
				ns01#CustomerAccountId: vars.InputData.customerAccountId,
				ns01#PrimaryFlag: p('soap.merge-customer.primary-flag'),
				ns01#RoleType: p('soap.merge-customer.role-type'),
				ns01#CreatedByModule: p('soap.merge-customer.created-by-module'),
				ns01#RelationshipId:  vars.InputData.relationshipId,
				ns01#CustomerAccountContactRole: {
					ns01#ResponsibilityType: p('soap.merge-customer.responsibility-type'),
					ns01#PrimaryFlag: p('soap.merge-customer.primary-flag'),
					ns01#CreatedByModule: p('soap.merge-customer.created-by-module')
				}
			}
		}
	}
}