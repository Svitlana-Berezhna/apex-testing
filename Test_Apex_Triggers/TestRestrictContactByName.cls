@isTest
private class TestRestrictContactByName {    
    @isTest static void TestInsertContactWithLastNameOfINVALIDNAME() {
        // Test data setup
        // Create a contact with a last name of 'INVALIDNAME', and then try to insert it
        Contact contact = new Contact(LastName='INVALIDNAME');
        
        // Perform test
        Test.startTest();  
        Database.SaveResult result = Database.insert(contact, false); 
        Test.stopTest();  
        // Verify 
        // In this case the insertion should have been stopped by the trigger,
        // so verify that we got back an error.
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                            result.getErrors()[0].getMessage());
    }
    
    @isTest static void TestUpdateContactWithLastNameOfINVALIDNAME() {
        // Test data setup
        // Create a contact with a last name of 'VALIDNAME', and then try to update last name to 'INVALIDNAME'        
        Contact contact = new Contact(LastName='VALIDNAME');
        insert contact;
        
        // Perform test
        Test.startTest();  
        contact.LastName='INVALIDNAME';
        Database.SaveResult result = Database.update(contact, false); 
        Test.stopTest();  
        // Verify 
        // In this case the updation should have been stopped by the trigger,
        // so verify that we got back an error.
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                            result.getErrors()[0].getMessage());
    }
}
