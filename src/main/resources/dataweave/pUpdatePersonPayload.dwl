%dw 2.0
output application/xml
ns ns0 http://xmlns.oracle.com/apps/cdm/foundation/parties/personService/applicationModule/types/
ns ns01 http://xmlns.oracle.com/apps/cdm/foundation/parties/personService/
---
{
	ns0#updatePersonProfile: {
		ns0#personDVO: {
			ns01#PersonProfileId: vars.inputData.personProfileId,
			ns01#PartyId: vars.inputData.personId,
			ns01#PersonFirstName: vars.inputData.personFirstName,
			ns01#PersonLastName: vars.inputData.personLastName
		}
	}
}