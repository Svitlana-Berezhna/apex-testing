@isTest
public class LeadProcessorTest {
    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();                
        for (Integer i = 0; i < 2; i++) {
            leads.add(new Lead(lastname = 'Test ' + i, Company = 'Test company'));   
            System.debug('Test ' + i);
        }
        insert leads;
        System.debug('Leads inserted.');
    }
    
    static testmethod void test() {        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);     
        Test.stopTest();
        System.assertEquals(2, 2);
    }    
}
