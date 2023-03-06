%dw 2.0
output application/xml
ns ns0 http://xmlns.oracle.com/apps/cdm/foundation/parties/customerAccountService/applicationModule/types/
ns ns01 http://xmlns.oracle.com/apps/cdm/foundation/parties/customerAccountService/
ns ns02 http://xmlns.oracle.com/apps/cdm/foundation/parties/partyService/
---
{
	ns0#mergeCustomerAccount: {
		ns0#customerAccount: {
			ns01#CustomerAccountId: vars.InputData.customerAccountId,
			ns01#CustomerAccountContact: {
				ns01#RoleType: p('soap.merge-customer.role-type'),
				ns01#CreatedByModule: p('soap.merge-customer.created-by-module'),
				ns01#RelationshipId: vars.InputData.relationshipId,
				ns01#OriginalSystemReference: {
					ns02#OrigSystem:  p('soap.merge-customer.orig-system'),
					ns02#OrigSystemReference:vars.InputData.salesforceContactId,
					ns02#OwnerTableName: p('soap.merge-customer.owner-table-name'),
					ns02#CreatedByModule: p('soap.merge-customer.created-by-module')
				}
			}
		}
	}
}