public class LeadProcessor implements database.Batchable<sObject>, database.Stateful {
	
    integer LeadsCount = 0;
    public database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator('select name, ID, leadsource from Lead');
    }
    
    public void execute(database.BatchableContext bc, list<lead> leads){
      	list<lead> leadsList = new list<lead>();
        for (Lead ld: leads){
            ld.leadsource = 'Dreamforce';
            leadsList.add(ld);
            LeadsCount = LeadsCount + 1;
        }
        update leadsList;
        
        
    }
    
    public void finish(database.BatchableContext bc){
        integer count = [select count() from Lead where leadsource = 'Dreamforce'];
        system.debug('count updated-->' + count);
    }
}