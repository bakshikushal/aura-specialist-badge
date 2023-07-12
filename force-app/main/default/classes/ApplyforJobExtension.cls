Public class ApplyforJobExtension{

    Public Candidate__c candidate= new candidate__c();
    Public ID pos_ID = APEXPAGES.CurrentPage().getParameters().get('jobID');
    Public Position__c position = new position__c();
    Public Job_Application__c jobapp {get; set;}
    
    Public ApplyforJobExtension(apexpages.standardcontroller controller){
    candidate = (candidate__c) controller.getRecord();    
    }
    
    Public position__c getPosition(){
    position = [select name, ID, Department__c, Educational_Requirement__c, Job_Description__c
                from position__c where ID =:pos_ID ];
    return position;
    }
            
    Public Candidate__c getCandidate(){
    return candidate;
    }
    
    Public void setCandidate(candidate__c can){
    candidate = can;
    }
    
    Public PageReference createjobapp(){
    insert candidate;
    jobapp = new Job_Application__c();
    jobapp.Candidate__c = candidate.ID;
    jobapp.position__c = pos_id;
    insert jobapp;
    PageReference p = page.jobappthanks;
    p.setRedirect(true);
    return p;
    
    }

}