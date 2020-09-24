@isTest
public class AccountProcessorTest {
    public static testMethod void testAccountProcessorTest(){
        Test.startTest();
        Account account = new Account();
        account.Name = 'Test Account';
        insert account;
        
        Contact cont = new Contact();
        cont.FirstName ='Test FirstName';
        cont.LastName ='Test LastName';
        cont.AccountId = account.Id;
        insert cont;
        
        Set<Id> setAccId = new Set<ID>();
        setAccId.add(account.Id);
        
        AccountProcessor.countContact(setAccId);       
        
        Account acc = [SELECT Number_of_Contacts__c FROM Account WHERE id = :account.id LIMIT 1];
        System.assertEquals(Integer.valueOf(acc.Number_of_Contacts__c), 1);
        Test.stopTest();
    } 
}
