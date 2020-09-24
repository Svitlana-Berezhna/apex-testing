@IsTest
public class AddPrimaryContactTest {
    
    @IsTest
    public static void testing() {
        List<Account> acc_lst = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            Account account = new account(Name = String.valueOf(i), Billingstate = 'NY');
            System.debug('account = '+ account);
            acc_lst.add(account);
        }
        for (Integer i = 0; i < 50; i++) {
            Account acc = new Account(Name = String.valueOf(50 + i), billingstate = 'CA');
            System.debug('account = ' + acc);
            acc_lst.add(acc);
        }      
        insert acc_lst;
        
        Test.startTest();
        Contact contact = new Contact(Lastname = 'Alex');
        AddPrimaryContact apc = new AddPrimaryContact(contact,'CA');
        System.debug('apc = ' + apc);
        System.enqueueJob(apc);
        Test.stopTest();
        
        List<Contact> c_lst = new List<Contact>([SELECT id FROM contact]);
        Integer size = c_lst.size();
        System.assertEquals(50, size);
    }    
}
