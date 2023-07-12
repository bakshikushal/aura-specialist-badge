public class AddPrimaryContact implements Queueable {

    String stateName;
    Contact conRecord;
    public AddPrimaryContact(Contact con, String st){
        this.stateName = st;
        this.conRecord = con;
    }
    
    public void execute(system.QueueableContext sc){
        list<Account> accList = [select name,ID, billingstate from Account where billingstate = :stateName LIMIT 200];
        list<Contact> conList = new List<Contact>();
        system.debug('Inputs-->' + stateName);
        system.debug('Acc for NY-->'+ accList);
        if(accList.size()>0){
            for (Account acc: accList){
                Contact accCon = conRecord.clone();
                accCon.accountId = acc.ID;
                conList.add(accCon);
            }
            insert conList;
        }
    }
    
}