@isTest
public class TestVerifyDate {

    @isTest
    public static void testCheckDatesFalse(){
       	Date inpD1 = Date.valueOf('2020-01-01');
       	Date inpD2 = Date.valueOf('2020-01-05');
       	Date returnD1 = VerifyDate.CheckDates(inpd1, inpd2);
        system.debug('Date1-->' + returnD1);
    	system.assertEquals(date.valueOf('2020-01-05'), returnD1);
    }
    
    @isTest
    public static void testCheckDatesTrue(){
        Date inpD1 = Date.valueOf('2020-01-01');
        Date inpD2 = Date.valueOf('2020-02-05');
        Date returnD1 = VerifyDate.CheckDates(inpd1, inpd2);
        system.debug('Date2-->' + returnD1);
        system.assertEquals(date.valueOf('2020-01-31'), returnD1);
    }
    
    @isTest
    public static void testCheckDatesSame(){
        Date inpD1 = Date.valueOf('2020-01-01');
        Date inpD2 = Date.valueOf('2020-01-31');
        Date returnD1 = VerifyDate.CheckDates(inpd1, inpd2);
        system.debug('Date2-->' + returnD1);
        system.assertEquals(date.valueOf('2020-01-31'), returnD1);
    }
    
    @isTest
    public static void testCheckDatesPast(){
        Date inpD1 = Date.valueOf('2020-01-01');
        Date inpD2 = Date.valueOf('2019-01-31');
        Date returnD1 = VerifyDate.CheckDates(inpd1, inpd2);
        system.debug('Date2-->' + returnD1);
        system.assertEquals(date.valueOf('2020-01-31'), returnD1);
    }

    
}