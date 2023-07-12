public with sharing class getAccountsList {
    @AuraEnabled
    public static List<Account> getAccList(){
        return [SELECT ID, NAME, PHONE, INDUSTRY FROM ACCOUNT];
    }

    @AuraEnabled
    public static List<Contact> getContactsForAccId(String accId){
        return [SELECT NAME, ID, PHONE FROM CONTACT WHERE AccountId =: accId ];
    }

    @AuraEnabled
    public static string deleteContacts(List<String> conIds){
        String msg = '';
        try{
            if (conIds.size() > 0){
                List<contact> conList = [Select ID, Name from Contact where ID in :conIds];
                system.debug('List to delete :'+ conList);                
                //delete conList;
                List<Database.DeleteResult> drList =  Database.delete(conList,false);
                msg = 'Success Deleted';
                for(Database.DeleteResult sr: drList){
                    if(sr.isSuccess()){
                        System.debug('Records Were Deleted Successfully');
                    }
                    else{
                        for(Database.Error err : sr.getErrors()){
                            System.debug('Following Error occurred: ' + err.getStatusCode() + 'And Message:'  + err.getMessage() + ' For Fields:'  + err.getFields());
                            msg = 'Error';
                        }
                    }                    
                }
            }                
        }catch(Exception ex){
            msg = ex.getMessage();
        }
        return msg;
    }
}