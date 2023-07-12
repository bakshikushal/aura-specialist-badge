@istest
public class AccountProcessorTest {
	
    @istest
    public static void testcountcontacts(){
        Account acc = new Account(name='test account');
        insert acc;
        list<ID> idList = new list<ID>();
        idList.add(acc.ID);
		test.startTest();
        AccountProcessor.countContacts(idList);
        test.stopTest();
    }
}