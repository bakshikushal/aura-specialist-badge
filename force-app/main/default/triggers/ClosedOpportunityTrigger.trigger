trigger ClosedOpportunityTrigger on Opportunity (after update, after insert) {
	List<task> tskList = new List<task>();
    for(Opportunity opp : trigger.new){
        if(opp.stagename == 'Closed Won'){
            task tsk = new task();
            tsk.Subject = 'Follow Up Test Task';
            //tsk.Subject = 'Trigger Task';
            tsk.WhatId = opp.ID;
            tsk.Priority = 'High';
            tsk.CurrencyIsoCode = 'USD';
            tsk.ActivityDate = System.today() + 1;
            tsklist.add(tsk);
        }
    }
     if(tskList.size()> 0)
            insert tskList;
}