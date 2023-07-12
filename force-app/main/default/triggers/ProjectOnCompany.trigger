trigger ProjectOnCompany on ITProject__c (after insert, after delete) {
    set<Id> setcomId = new set<ID>();
    List<ITCompany__c> com_list = new List<ITCompany__c>() ;
    List<ITCompany__c> com_list_toupdate = new List<ITCompany__c>() ;
    
    if(trigger.IsInsert){
        for (ITProject__c proj : Trigger.New){
            if(proj.CompanyName__c != NULL)
                setcomId.add(proj.CompanyName__c);
        }    
    }
    
    if(trigger.IsDelete){
        for (ITProject__c proj : Trigger.old){
            if(proj.CompanyName__c != NULL)
                setcomId.add(proj.CompanyName__c);
        }    
    }
    

	    
    com_list = [select ID, Name, TotalProjects__c, (select Id, name from ITProjects__r) from ITCompany__c where ID in :setcomId];
    
    for (ITCompany__c com1 : com_list){
        com1.TotalProjects__c = com1.ITProjects__r.size();
        com_list_toupdate.add(com1);
    }
    update com_list;
}