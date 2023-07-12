public class test_class1{
    
     String com_name = 'New Company Just Created' ;
     ITCompany__c[] com_obj = [select name,Id from ITCompany__c ];
     ITCompany__c[] com_list = [select name,Id,Location__c,NoOfEmployees__c from ITCompany__c ];
        
    Public String getcom_name ()
    {
        return com_name;
    }    
    
    Public ITCompany__c[]  getcom_obj ()
    {
        return com_obj;
    }
    
    Public ITCompany__c[] getcom_list()
    {
        return com_list ;
    }
    
    
   
}