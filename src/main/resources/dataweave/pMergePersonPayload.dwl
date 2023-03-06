%dw 2.0
output application/xml
ns ns0 http://xmlns.oracle.com/apps/cdm/foundation/parties/personService/applicationModule/types/
ns ns01 http://xmlns.oracle.com/apps/cdm/foundation/parties/personService/
ns ns02 http://xmlns.oracle.com/apps/cdm/foundation/parties/contactPointService/
ns ns03 http://xmlns.oracle.com/apps/cdm/foundation/parties/relationshipService/
---
{
	ns0#mergePerson: {
		ns0#personParty: {
			ns01#PartyId: vars.inputData.personId,
			ns01#Email: {
				ns02#ContactPointId: vars.inputData.email.contactPointId,
				ns02#OwnerTableName: p('soap.merge-person.owner-table-name'),
				ns02#PrimaryFlag: vars.inputData.email.primaryFlag,
				ns02#CreatedByModule: p('soap.merge-person.created-by-module'),
				ns02#ContactPointPurpose: p('soap.merge-person.contact-point-purpose'),
				ns02#StartDate: vars.inputData.email.startDate,
				ns02#RelationshipId: vars.inputData.email.relationshipId,
				ns02#EmailAddress: vars.inputData.email.emailAddress
			}
		}
	}
}