Public Class showCompanyDetails{

    list<ITCompany__c> com1 = [select name, ID, NoOfEmployees__c,Location__c from ITCompany__c where Location__c  = 'Mumbai'];
    list<ITCompany__c> com2 = [select name, ID, NoOfEmployees__c,Location__c from ITCompany__c where Location__c  = 'Delhi'];
        
    Public list<ITCompany__c> getCom1(){
    return com1;
    }
    
    Public list<ITCompany__c> getCom2(){
    return com2;
    }
    
    
    
    


}