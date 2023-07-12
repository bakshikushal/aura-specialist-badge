Public Class Sample_CustomSetController{
    
    Public apexPages.StandardSetController cusSetcont{
    get{    if(cusSetcont == NULL){
                cusSetcont = new apexPages.StandardSetController(database.getQueryLocator(
                [select name, id, phone, fax from account]));
        }
        return cusSetcont ;}
    set;    }  
   
    
    Public list<Account> getAccts(){
        return (List<Account>)cusSetcont.getRecords();
    }

}