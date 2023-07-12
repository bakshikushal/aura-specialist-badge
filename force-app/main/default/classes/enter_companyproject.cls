Public Class enter_companyproject{


    ITCompany__c com1 = new ITCompany__c();
    ITProject__c proj1 = new ITProject__c();
    
    Public ITCompany__c getcom1(){
    return com1 ;
    }
    
    Public ITProject__c getproj1(){
    return proj1;
    }
    
    Public PageReference enter_company(){
    return Page.enter_company;
    }
    
    Public PageReference enter_project(){
    return Page.enter_project;
    }
    
    Public PageReference review_page(){
    return Page.review_page;
    }
    
   
    Public PageReference submit_comproj(){
    insert com1 ;
    proj1.CompanyName__c = com1.ID;
    insert proj1 ;
   
    return Page.enter_company;
    } 
    
}