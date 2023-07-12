Public Class ScheduleJob implements Schedulable{

    public void execute(SchedulableContext sc){
    ITCompany__c com = new ITCompany__c(name = 'newSchCom');
    insert com;
    }

}