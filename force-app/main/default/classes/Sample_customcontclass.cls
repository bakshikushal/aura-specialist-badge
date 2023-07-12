Public Class Sample_customcontclass{

    Public Account acc {get ; set; }
    
    Public Sample_customcontclass(){
    Id acc_id = ApexPages.CurrentPage().getParameters().get('ID');
    if (acc_id == NULL){
        acc = new Account();               
        }
    else{
        acc = [select name, phone from account where ID = :acc_id];
        }    
    }
    
    Public PageReference SaveIt(){
        upsert acc;
        return null;
    }
   
}