global class batchClassWithQuery implements Database.batchable<sObject>{
   
   String query;
   String Field;
   String Value;
   
   public batchClassWithQuery(String q, String f, String v){
       query = q;
       field = f;
       Value = v;
   }
   
   
   global  Database.querylocator start(Database.BatchableContext info){
        return database.getquerylocator(query);
   }    
   
   global void execute(Database.BatchableContext info, list<sObject> Scope ){
       List<sObject> accsToUpdate = new List<sObject>();
     for(sObject a : scope){
         a.put(Field,Value);
         accsToUpdate.add(a);
     }

     update accsToUpdate;
 }    

   global void finish(Database.BatchableContext info){    
     }
 }