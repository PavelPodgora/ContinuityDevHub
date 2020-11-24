public with sharing class AccountTriggerHelper {
 
    public static List<Opportunity> getOppList(Set<Id> mapAccIds){

        return                            [SELECT   AccountId,
                                                    Product_Interest__c,
                                                    Literature_Codes__c,
                                                    Trade_Fair_Invitation_Codes__c,
                                                    Applications_Or_Industries__c,
                                                    Related_Industries__c,
                                                    Annual_Turnover__c,
                                                    Market_Share__c,
                                                    Employees__c,
                                                    Customer_Types__c
                                            FROM    Opportunity 
                                            WHERE   AccountId IN :mapAccIds];
   
   
       }
}