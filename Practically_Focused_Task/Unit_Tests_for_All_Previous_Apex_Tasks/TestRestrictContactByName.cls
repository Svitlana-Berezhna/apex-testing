@isTest
private class TestRestrictContactByName {    
    @isTest 
    static void TestInsertContactWithLastNameOfINVALIDNAME() {
        Contact contact = new Contact(LastName = 'INVALIDNAME');
        
        Test.startTest();  
        Database.SaveResult result = Database.insert(contact, false); 
        Test.stopTest();  
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                            result.getErrors()[0].getMessage());
    }
    
    @isTest 
    static void TestUpdateContactWithLastNameOfINVALIDNAME() {       
        Contact contact = new Contact(LastName = 'VALIDNAME');
        insert contact;
        
        Test.startTest();  
        contact.LastName = 'INVALIDNAME';
        Database.SaveResult result = Database.update(contact, false); 
        Test.stopTest();  
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                            result.getErrors()[0].getMessage());
    }
}
