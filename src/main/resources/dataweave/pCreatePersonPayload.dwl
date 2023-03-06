%dw 2.0
output application/xml
ns ns0 http://xmlns.oracle.com/apps/cdm/foundation/parties/personService/applicationModule/types/
ns ns01 http://xmlns.oracle.com/apps/cdm/foundation/parties/personService/
ns ns02 http://xmlns.oracle.com/apps/cdm/foundation/parties/partyService/
ns ns03 http://xmlns.oracle.com/apps/cdm/foundation/parties/relationshipService/
ns ns04 http://xmlns.oracle.com/apps/cdm/foundation/parties/contactPointService/
---
{
	ns0#createPerson: {
		ns0#personParty: {
			ns01#CreatedByModule: p('soap.create-person.created-by-module'),
			ns01#OriginalSystemReference: {
				ns02#OrigSystem: p('soap.create-person.orig-system'),
				ns02#OrigSystemReference: vars.inputData.salesforceContactId,
				ns02#OwnerTableName: p('soap.create-person.owner-table-name-1'),
				ns02#CreatedByModule: p('soap.create-person.created-by-module')
			},
			ns01#PersonProfile: {
				ns01#PersonFirstName: vars.inputData.personFirstName,
				ns01#PersonLastName: vars.inputData.personLastName,
				ns01#CreatedByModule: p('soap.create-person.created-by-module')
			},
			ns01#Relationship: {
				ns03#SubjectType: p('soap.create-person.subject-type'),
				ns03#SubjectTableName: p('soap.create-person.subject-table-name'),
				ns03#ObjectId: vars.inputData.orgId,
				ns03#ObjectType:p('soap.create-person.object-type'),
				ns03#ObjectTableName: p('soap.create-person.object-table-name'),
				ns03#RelationshipCode: p('soap.create-person.relationship-code'),
				ns03#RelationshipType: p('soap.create-person.relationship-type'),
				ns03#CreatedByModule: p('soap.create-person.created-by-module'),
				ns03#OrganizationContact: {
					ns03#CreatedByModule: p('soap.create-person.created-by-module'),
					ns03#OrganizationContactRole: {
						ns03#RoleType: p('soap.create-person.role-type'),
						ns03#CreatedByModule: p('soap.create-person.created-by-module')
					}
				},
				(ns03#Phone: {
					ns04#OwnerTableName: p('soap.create-person.owner-table-name-1'),
					ns04#PrimaryFlag: p('soap.create-person.primary-flag'),
					ns04#OrigSystemReference: "CPP1_" ++ vars.inputData.salesforceContactId,
					ns04#CreatedByModule: p('soap.create-person.created-by-module'),
					ns04#OrigSystem: p('soap.create-person.orig-system'),
					ns04#PhoneNumber: vars.inputData.phone,
					ns04#PhoneLineType: p('soap.create-person.phone-line-type')
				}) if(vars.inputData.phone != ""),
				
				ns03#OriginalSystemReference: {
					ns02#OrigSystem: p('soap.create-person.orig-system'),
					ns02#OrigSystemReference: "REL_" ++ vars.inputData.salesforceContactId,
					ns02#OwnerTableName: p('soap.create-person.owner-table-name-2'),
					ns02#CreatedByModule: p('soap.create-person.created-by-module')
				},
				ns03#Email: {
					ns04#OwnerTableName: p('soap.create-person.owner-table-name-1'),
					ns04#OrigSystemReference: "CPE1_" ++ vars.inputData.salesforceContactId,
					ns04#CreatedByModule: p('soap.create-person.created-by-module'),
					ns04#OrigSystem: p('soap.create-person.orig-system'),
					ns04#EmailAddress: vars.inputData.email
				},
				
				(ns03#Email: {
					ns04#OwnerTableName: p('soap.create-person.owner-table-name-1'),
					ns04#PrimaryFlag: p('soap.create-person.primary-flag'),
					ns04#OrigSystemReference: "CPE2_" ++ vars.inputData.salesforceContactId,
					ns04#CreatedByModule: p('soap.create-person.created-by-module'),
					ns04#OrigSystem: p('soap.create-person.orig-system'),
					ns04#EmailAddress: vars.inputData.email2
				}) if(vars.inputData.email2 != "")
			}
		}
	}
}