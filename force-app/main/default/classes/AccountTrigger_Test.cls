@IsTest
public class AccountTrigger_Test {


       @testSetup static void setup() {

        Id recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Customer Account').getRecordTypeId();
        Account custAcc = new Account(Name = 'Customer Account',RecordTypeId = recordTypeId);
        insert custAcc;

        Opportunity opp = new Opportunity(Name = 'Opp 1', AccountId = custAcc.Id, StageName = 'Qualification', CloseDate = Date.today().addMonths(2));
        insert opp;

    }

    @IsTest
    static void testUpdateOppMarketingAttributes(){

        User user = getUser();
        //System.runAs(user){
            Account custAcc = [SELECT   Product_Interest__c,
                                        Literature_Codes__c,
                                        Trade_Fair_Invitation_Codes__c,
                                        Applications_Or_Industries__c,
                                        Related_Industries__c,
                                        AnnualRevenue,
                                        Market_Share__c,
                                        NumberOfEmployees,
                                        Customer_Types__c
                            FROM        Account
                            LIMIT       1];

        custAcc.NumberOfEmployees = 123;
        update custAcc;
        
        Opportunity opp = [SELECT Employees__c FROM Opportunity WHERE AccountId = :custAcc.Id LIMIT 1];

        System.assertEquals(123, opp.Employees__c,'Field on Opportunity should be the same as on Account record');

        //}
    }


    

    private static User getUser(){

        String uniqueUserName = 'testuser' + DateTime.now().getTime() + '@testorg.com';
        Profile prof = [SELECT Id FROM Profile WHERE Name='Standard User' LIMIT 1];
        User user = new User(Alias = 'TestUser',
                            Email='testuser@testorg.com',
                            EmailEncodingKey='UTF-8',
                            LastName='Testing',
                            LanguageLocaleKey='en_US',
                            LocaleSidKey='en_US',
                            ProfileId = prof.Id,
                            TimeZoneSidKey='America/Los_Angeles',
                            UserName=uniqueUserName);
        insert user;
        //PermissionSet permissionSet = [SELECT Id,Name FROM PermissionSet WHERE Name = 'GTS_General' LIMIT 1];
        //PermissionSetAssignment psa = new PermissionSetAssignment (PermissionSetId = permissionSet.Id, AssigneeId = user.Id);
        //insert psa;

        return user;
    }
    
}