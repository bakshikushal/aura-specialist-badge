trigger Tigger_TotComEmp on ITProject__c (before insert) {
    decimal com_emp = 0;
    decimal tot_emp = 0;
    set<ID> comId = new set<ID>() ;
    for (ITProject__c proj : Trigger.New){
        if(proj.CompanyName__c != NULL){
            comId.add(proj.CompanyName__c);
        }
        if(comId.size() > 0){
                Map<Id,ITCompany__c> com_map = new Map<Id,ITCompany__c>([select Location__c, NoOfEmployees__c 
                                                                         from ITCompany__c where ID in :comId]) ;
                for (ITProject__c proj2 : Trigger.New){
                    ITCompany__c com1 = com_map.get(proj2.CompanyName__c);
                    com_emp = com1.NoOfEmployees__c;
                    tot_emp = com_emp + proj2.TotalMembers__c;
                    if(tot_emp > 1000 )
                        proj2.adderror('Exceeding No of Emps from 1000');
            }
        }
        
    }
    
}