trigger Trigger_Emp on ITProject__c (before insert) {
    Trigger_empclass.totalEmp(Trigger.New);
}