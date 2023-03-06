%dw 2.0
output application/xml
ns ns0 http://xmlns.oracle.com/apps/cdm/foundation/parties/customerAccountService/applicationModule/types/
ns ns01 http://xmlns.oracle.com/apps/cdm/foundation/parties/customerAccountService/
ns ns02 http://xmlns.oracle.com/apps/cdm/foundation/parties/partyService/
ns ns03 http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccount/
---
{
    ns0#createCustomerAccount: {
        ns0#customerAccount: {
            ns01#PartyId: vars.inputData.partyId default "",
            ns01#CustomerClassCode: if(vars.inputData.primaryVar as String == "true") "VAR" else vars.inputData.businessTypePrimary default "",
            ns01#AccountName: vars.inputData.accountName default "",
            ns01#CreatedByModule: "HZ_WS",
            ns01#OrigSystemReference: vars.inputData.customerAccountId default "",
            ns01#OriginalSystemReference: {
            	ns02#OwnerTableName: "HZ_CUST_ACCOUNTS",
            	ns02#OrigSystemReference: vars.inputData.customerAccountId default "",
            	ns02#OrigSystem: "SFDC",
            	ns02#CreatedByModule: "HZ_WS"
            },
            ns01#CustAcctInformation: {
            	ns03#warrantyPolicy: vars.inputData.warrantyPolicy default "",
            	ns03#internationalGovernmentAffilia: vars.inputData.internationalGovernmentAffilia default "",
                ns03#freightTerms: vars.inputData.freightTerms default "",
                ns03#freeOnBoardPoint: vars.inputData.freeOnBoardPoint default "Shipping Point",
                ns03#shipMethod: vars.inputData.shipMethod default "",
                ns03#primarySalesPerson: vars.bipReportResponse.DATA_DS.G_1.SALESREP_NUMBER default "",
                ns03#sfdcAddressIdAccount: vars.inputData.sfdcAddressIdAccount default "",
                ns03#globalRegion: vars.inputData.globalRegion default "",
                ns03#country: vars.inputData.country default "",
                ns03#franchise: vars.inputData.franchise default "",
                ns03#region: vars.inputData.region default "",
                ns03#territory: vars.inputData.territoryName default "",
                ns03#salesTerritoryParent: vars.inputData.salesTerritoryParent default "",
                ns03#rmcsRegion: vars.inputData.rmcsRegion default ""
            }
        }
    }
}