global class batchClassWithIterable implements Database.batchable<sObject>{
   
   global list<Account> start(Database.BatchableContext info){
       list<Account> acclist = [select Id,name from Account];
       return acclist ;
   }    
   
   global void execute(Database.BatchableContext info, List<Account> scope){
       List<Account> accsToUpdate = new List<Account>();
     for(Account a : scope){
         a.Description = 'Updated by Kush';
         accsToUpdate.add(a);
     }

     update accsToUpdate;
 }    

   global void finish(Database.BatchableContext info){    
     }
 }