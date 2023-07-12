@istest
public class AddPrimaryContactTest {

    @testsetup
    static void createAcc(){
        list<Account> accList = new list<Account>();
        for(integer i=0; i<100; i++){
            if(i<50){
            	Account accNy = new Account(name='Test Acc'+i, billingstate='NY');  
                accList.add(accNy);
            }
            else{
                Account accCA = new Account(name='Test Acc'+i, billingstate='CA');
                accList.add(accCA);
            }
        }
        insert accList;
    }
    
    @istest
    static void testQueueJob(){
        Contact Con = new Contact(lastName='Test Batch Job Con', firstname='Test First Name');
        AddPrimaryContact accJob = new AddPrimaryContact(con,'NY');
		test.startTest();
        system.enqueueJob(accJob);
		test.stopTest();
        integer noOfContacts = [select count() from contact];
        system.assertEquals(50, noOfContacts);
    }
}