public with sharing class AccountTriggerHandler {

    //public static Boolean executeTrigger = true;

    public static Boolean attributesAreChanged(Map<Id, Account> mapAcc) {
        Boolean attributesChanged = false;

        List<Opportunity> listOpp = AccountTriggerHelper.getOppList(mapAcc.keySet());
        //List<Opportunity> listForUpdate = new List<Opportunity>();

        for (Opportunity opp : listOpp) {
            Account acc = mapAcc.get(opp.AccountId);

            if (opp.Product_interest__c != acc.Product_Interest__c ||
                    opp.Literature_Codes__c != acc.Literature_Codes__c ||
                    opp.Trade_Fair_Invitation_Codes__c != acc.Trade_Fair_Invitation_Codes__c ||
                    acc.Applications_Or_Industries__c != opp.Applications_Or_Industries__c ||
                    //acc.Related_Industries__c != opp.Related_Industries__c ||
                    acc.AnnualRevenue != opp.Annual_Turnover__c ||
                    acc.Market_Share__c != opp.Market_Share__c ||
                    acc.NumberOfEmployees != opp.Employees__c ||
                    acc.Customer_Types__c != opp.Customer_Types__c) {

                attributesChanged = true;
            }
        }
        return attributesChanged;
    }

    public static void updateOppMarketingAttributes(Map<Id, Account> mapAcc) {

        List<Opportunity> listOpp = AccountTriggerHelper.getOppList(mapAcc.keySet());
        List<Opportunity> listForUpdate = new List<Opportunity>();

        for (Opportunity opp : listOpp) {
            Account acc = mapAcc.get(opp.AccountId);

            opp.Product_interest__c = acc.Product_Interest__c;
            opp.Literature_Codes__c = acc.Literature_Codes__c;
            opp.Trade_Fair_Invitation_Codes__c = acc.Trade_Fair_Invitation_Codes__c;
            opp.Applications_Or_Industries__c = acc.Applications_Or_Industries__c;
            //acc.Related_Industries__c = opp.Related_Industries__c;
            opp.Annual_Turnover__c = acc.AnnualRevenue;
            opp.Market_Share__c = acc.Market_Share__c;
            opp.Employees__c = acc.NumberOfEmployees;
            opp.Customer_Types__c = acc.Customer_Types__c;

            listForUpdate.add(opp);
        }

        if (listForUpdate.size() > 0) {
            //OpportunityTriggerHandler.executeTrigger = false;
            update listForUpdate;
            //OpportunityTriggerHandler.executeTrigger = true;
        }
    }
}