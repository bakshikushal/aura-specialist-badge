Public Class showCompany{

    String Keyword;
    String comName;
    String Proj1;
    List<ITCompany__c> comList ;
    List<ITCompany__c> LocList ;
    ITProject__c[] projList;
    ITProject__c each_proj;
    
    Public String getKeyword(){
    return keyword;
    }
    
    Public String getProj1(){
    return Proj1;
    }
    
    Public Void setProj1(String Input){
    Proj1 = Input;
    }
    
    Public void setKeyword(String input){
    keyword=input;
    }
    
    Public list<ITCompany__c> getcomList(){
    return comList ;
    }
    
    Public list<ITCompany__c> getLocList(){
    return locList;
    }
    
    public ITProject__c geteach_proj(){
    return each_proj ;
    }
    
    Public Void setcomName(String input){
    comName = input;
    }
        
    Public String getcomName(){
    return comName;
    }
    
    Public List<ITProject__c> getProjList(){
    return projList;
    }
    
    
    Public PageReference showCompanyList(){
    comname = '';
    comList=(list<ITCompany__c>) [FIND :keyword IN ALL FIELDS RETURNING ITCompany__c(Name,ID, Location__c,NoOfEmployees__c)][0];
    
    return null;
    }
        
        
    Public PageReference showLocList(){
    keyword = '';    
    LocList=[select Name,ID,Location__c,NoOfEmployees__c, (select name, TotalMembers__c, CompanyName__r.name from ITProjects__r ) 
    from ITCompany__c where Location__c = :comname];
       
    integer list_size =    LocList.size() ;
    if(list_size >= 1)
    {   
        projList  = LocList[0].ITProjects__r;
        
        for (ITProject__c proj :projList)
        {
            each_proj = proj ;
        }
    }
    else 
    system.debug('Issue');
    
    
   
    return null;
    }    
}