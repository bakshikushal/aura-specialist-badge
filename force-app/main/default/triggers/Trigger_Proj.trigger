trigger Trigger_Proj on ITProject__c (before insert) {
    for (ITProject__c proj : Trigger.New)
    {
        if(proj.TotalMembers__c > 100)
            proj.addError('No Of members cant be more than 100');
    }
}