Public Class Sample_controllerextn{
    
    Public Account acc{get; set;}
    Public Sample_controllerextn(ApexPages.StandardController stdcnt){
        acc = (Account)stdcnt.getRecord();    
    }
    
    Public string getgreeting(){
        return ( 'Hello this account is for ' + acc.name + ' & ID is' + acc.ID) ;  
    }
    



}