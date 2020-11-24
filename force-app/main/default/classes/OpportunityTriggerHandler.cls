public with sharing class OpportunityTriggerHandler {

    //public static Boolean executeTrigger = true;

    public static Boolean attributesAreChanged(List<Opportunity> listOpp){

        Boolean attributesChanged = false;

        Map<Id,Opportunity> mapAcc = new Map<Id,Opportunity>();

        for (Opportunity opp : listOpp) {
            mapAcc.put(opp.AccountId,opp);
        }

        List<Account> listAcc = OpportunityTriggerHelper.getAccountList(mapAcc.keyset());

        List<Account> listForUpdate = new List<Account>();

        for (Account acc : listAcc) {
            Opportunity opp = mapAcc.get(acc.Id);

            if(opp.Product_Interest__c != acc.Product_Interest__c ||
             opp.Literature_Codes__c != acc.Literature_Codes__c ||
             opp.Trade_Fair_Invitation_Codes__c != acc.Trade_Fair_Invitation_Codes__c ||
             acc.Applications_Or_Industries__c != opp.Applications_Or_Industries__c ||
             acc.Related_Industries__c != opp.Related_Industries__c ||
             acc.AnnualRevenue != opp.Annual_Turnover__c ||
             acc.Market_Share__c != opp.Market_Share__c ||
             acc.NumberOfEmployees != opp.Employees__c ||
             acc.Customer_Types__c != opp.Customer_Types__c){

                 attributesChanged = true;
             }
        }
    
        return attributesChanged;
    }
   
    public static void updateAccountMarketingAttributes(List<Opportunity> listOpp){

        Map<Id,Opportunity> mapAcc = new Map<Id,Opportunity>();

        for (Opportunity opp : listOpp) {
            mapAcc.put(opp.AccountId,opp);
        }

       List<Account> listAcc = OpportunityTriggerHelper.getAccountList(mapAcc.keyset());

        List<Account> listForUpdate = new List<Account>();

        for (Account acc : listAcc) {
            Opportunity opp = mapAcc.get(acc.Id);

                acc.Product_Interest__c = opp.Product_Interest__c;
                acc.Literature_Codes__c = opp.Literature_Codes__c;
                acc.Trade_Fair_Invitation_Codes__c = opp.Trade_Fair_Invitation_Codes__c;
                acc.Applications_Or_Industries__c = opp.Applications_Or_Industries__c;
                acc.Related_Industries__c = opp.Related_Industries__c;
                acc.AnnualRevenue = opp.Annual_Turnover__c;
                acc.Market_Share__c = opp.Market_Share__c;
                acc.NumberOfEmployees =(Integer)opp.Employees__c;
                acc.Customer_Types__c = opp.Customer_Types__c;
            
            listForUpdate.add(acc);
            
        }

        if(listForUpdate.size()>0){
            //AccountTriggerHandler.executeTrigger = false;
            update listForUpdate;
           // AccountTriggerHandler.executeTrigger = true;
        }
    }
}