Global Class ScheduleProject implements Schedulable {
    
    Public void execute(SchedulableContext sch){
    ITCompany__c com = new ITCompany__c(name = 'NewCompanySch');
    insert com;
    }

}