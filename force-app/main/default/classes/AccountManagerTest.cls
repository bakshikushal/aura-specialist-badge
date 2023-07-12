@istest(seealldata='True')
public class AccountManagerTest {
	@isTest
    static void testAccMgr(){
        Account testAcc = new Account(name = 'Account Testing latest');
        insert testAcc;        
        RestRequest req = new RestRequest();
        req.requestURI = 'https://kushorg-dev-ed.my.salesforce.com/services/apexrest/Accounts/' + testAcc.ID + '/contacts';
        req.Httpmethod = 'GET';
        Restcontext.request = req;
		Account retAcc = AccountManager.getAccount();       
        system.debug('acc returned :' +retAcc);
        system.debug('acc name : ' +retAcc.name);
        system.debug('URI IS:' + req.requestURI);
       
    }
}