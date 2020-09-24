@isTest
private class TestVerifyDate {
    @isTest 
    static void testCheckDatesWhenDateWithin30Days() {
        Date date1 = Date.newInstance(2020, 9, 1);
        Date date2 = Date.newInstance(2020, 9, 20);
        Date dateWithin30Days = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(Date.newInstance(2020, 9, 20), dateWithin30Days);
    }
    
    @isTest 
    static void testCheckDatesWhenDateNotWithin30Days() {
        Date date1 = Date.newInstance(2020, 9, 1);
        Date date2 = Date.newInstance(2020, 10, 1);
        Date dateNotWithin30Days = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(Date.newInstance(2020, 9, 30), dateNotWithin30Days);
    }
}
