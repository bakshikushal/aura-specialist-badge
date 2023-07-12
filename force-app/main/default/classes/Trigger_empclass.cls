Public Class Trigger_empclass{
      
      Public static void totalEmp(list<ITProject__c> proj){
      
      String com_name = proj[0].CompanyName__r.name;
      ITCompany__c com = [select NoOfEmployees__c from ITCompany__c  where name =: com_name  ];
      
                       
      decimal count_com_emp = com.NoOfEmployees__c ;
                
      for (ITProject__c  each_proj : proj){
          count_com_emp = count_com_emp +  each_proj.TotalMembers__c ;
              if (count_com_emp > 1000)
                  each_proj.addError('No of employees greater than 1000');
          }
      } 
}