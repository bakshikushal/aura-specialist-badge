trigger rejectUneducatedTrigger on Job_Application__c (before insert, before update) {
  List<Job_Application__c> newjobapps = new list<Job_Application__c>();
  newjobapps = trigger.new;
  for (Job_Application__c jobapplication : newjobapps){
      position__c orig_pos = [select name, Reject_Undereducated__c from Position__c
                              where ID =: jobapplication.position__c ] ;
      if(orig_pos.Reject_Undereducated__c)
        jobapplication.status__c = 'Rejected';                         
  }

}