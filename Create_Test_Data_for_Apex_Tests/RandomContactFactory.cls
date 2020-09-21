public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numberOfContacts, String lastNameOfContacts) {
        List<Contact> contacts = new List<Contact>();        
        for(Integer i = 1; i <= numberOfContacts; i++) {
            Contact contact = new Contact(FirstName = 'Test ' + i,
                                          LastName = lastNameOfContacts); 
            contacts.add(contact);
        }
        insert contacts;
        
        return contacts;
    }
}
