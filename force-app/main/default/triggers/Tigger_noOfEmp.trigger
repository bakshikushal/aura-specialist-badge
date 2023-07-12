trigger Tigger_noOfEmp on ITProject__c (before insert, before update ) {
    
      for (ITProject__c proj : Trigger.New){
           decimal total_emp = 0 ; 
           decimal city_emp = 0;
          List<ITProject__c> proj1 = [select name,id, TotalMembers__c from ITProject__c where City__c = :proj.City__c];
          if(proj1.size() > 0){    
              for (ITProject__c proj2 : proj1){
                  city_emp =  city_emp +  proj2.TotalMembers__c;
                  total_emp = city_emp;
                  if(city_emp > 100)
                      proj2.adderror('No of Emp in This Location exceed 100');
              }
              
              total_emp = total_emp + proj.TotalMembers__c ;
               if(total_emp > 100)
                      proj.adderror('No of Emp in This Location exceed 100');
              
              
          }    
          
      }  
}