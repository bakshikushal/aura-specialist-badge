public class AccountProcessor {
	
    @future
    public static void countContacts(list<ID> accIds){
        List<Account> accList = new list<Account>();
        for (account acc : [select name,id,Number_of_Contacts__c, (select name,ID from contacts) from account where ID in :accIds]){
			acc.Number_of_Contacts__c = acc.contacts.size();
            accList.add(acc);
        }
    	update accList;
    }
}