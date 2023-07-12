trigger OpportunityChangeTrigger on OpportunityChangeEvent (after insert) {
	list<task> taskList = new List<task>();
    for (OpportunityChangeEvent oppEvent : trigger.new){
        system.debug('Opp event Called by Kushal :' + JSON.serialize(oppEvent));
        EventBus.ChangeEventHeader header = oppEvent.ChangeEventHeader;
        if(header.changetype == 'UPDATE' && oppEvent.IsWon == true){
            task tk = new task();
            tk.Subject = 'Follow up on won opportunities: ' + header.recordIds;
			tk.OwnerId = header.CommitUser;
			taskList.add(tk);            
        }        
    }
    if(taskList.size() > 0){
        insert taskList;
    }
}