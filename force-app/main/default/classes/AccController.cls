Public Class AccController {

    Public Account acc {get; set;}
    Public Acccontroller(){
        ID acc_id = ApexPages.CurrentPage().getParameters().get('ID');
        if(acc_id == NULL){
            acc = new Account();
        }
        else 
            acc = [SELECT Name, Phone, Industry FROM Account WHERE Id = :acc_id];    
    }
    
    Public PageReference Save(){
        upsert acc;                               
       return null;
    }
}