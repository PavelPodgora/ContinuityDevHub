public with sharing class OpportunityTriggerHelper {
    
    public static List<Account> getAccountList(Set<Id> mapAccIds){

     return                            [SELECT   Product_Interest__c,
                                                Literature_Codes__c,
                                                Trade_Fair_Invitation_Codes__c,
                                                Applications_Or_Industries__c,
                                                Related_Industries__c,
                                                AnnualRevenue,
                                                Market_Share__c,
                                                NumberOfEmployees,
                                                Customer_Types__c
                                       FROM     Account 
                                       WHERE    ID IN :mapAccIds];


    }
}