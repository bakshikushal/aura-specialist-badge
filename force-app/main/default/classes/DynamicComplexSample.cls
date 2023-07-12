Public Class DynamicComplexSample{

    Public Contact Con {get; set;}
    
    Public DynamicComplexSample(ApexPages.StandardController cont){
    String cont_id = ApexPages.CurrentPage().getParameters().get('ID');
    String new_query = 'Select ID,' + joinList(ConList, ',') + ' FROM Contact WHERE Id = :cont_id' ;
    this.con = Database.query(new_query);
    }
    
    Public List<String> ConList{
    get { 
        if (conList == NULL){
            conList = new List<String>();
            conList.add('Name');
            conList.add('MobilePhone');
            conList.add('Account.name');
            
            }
         return conList;
         }
     set;       
     }
     Public String joinList(List<String> old_list, String s){
     String joined = '';
     Boolean Sep = True;
     for (String item: old_list){
         if(item != NULL){
            if(Sep){
                Sep = False;
                }
            else{
            joined = joined + s;
            }
            joined = joined + item;    
         }
         
     }
     return joined;
     
     }
        
    

}