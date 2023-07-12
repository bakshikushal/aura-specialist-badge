trigger InsertComforProj on ITProject__c (before insert) {
    
    set<ID> projIDset = new set<ID>();
    List<ITCompany__c> com_list_insert = new List<ITCompany__c>() ;
    List<ITProject__c> proj_list = new List<ITProject__c>() ;
    
    for (ITProject__c proj : Trigger.New){
            proj_list.add(proj);
    }
    
    if(proj_list.size()> 0){
        List<ITCompany__c> com_list = new List<ITCompany__c>() ;    
        map<String,ITProject__c> com_map = new map<String,ITProject__c>();     
        for (ITProject__c proj : proj_list){
            String com_name = proj.name;
            com_map.put(com_name,proj);    
            ITCompany__c temp_com = new ITCompany__c(name=com_name);
            com_list_insert.add(temp_com);
        }
        
        insert com_list_insert;
        for (ITCompany__c com :com_list_insert ){
            if(com_map.containsKey(com.name)){
                  ITProject__c prj1 = com_map.get(com.name) ;
                  prj1.CompanyName__c  = com.ID;
            }
        }
        
    }
        
     
    
    
    
}