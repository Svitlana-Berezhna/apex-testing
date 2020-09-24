public class StringArrayTest {
    public static List<String> generateStringArray(Integer numberOfReturnedStrings) {
        List<String> listOfStrings = new List<String>();
        for(Integer i = 0; i < numberOfReturnedStrings; i++) {               
            listOfStrings.add('Test ' + i);
            System.debug(listOfStrings[i]);
        }         
        return listOfStrings; 
    }
}
