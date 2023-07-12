trigger OrderEventTrigger on Order_Event__e (after insert) {
	list<task> taskList = new list<task>();
    for (Order_Event__e  event: trigger.new){
        if(event.Has_Shipped__c == true){
            task tsk = new task();
            tsk.Priority = 'Medium';
            tsk.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
            tsk.OwnerId = event.CreatedById;
            tsk.status = 'In Progress';
        	taskList.add(tsk);
            system.debug('Creating Task from Trigger'+tsk);
        }
           insert taskList;
    }
}