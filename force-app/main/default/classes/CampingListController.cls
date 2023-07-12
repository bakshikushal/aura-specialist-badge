public with sharing class CampingListController {

    @Auraenabled
    public static list<Camping_Item__c> getItems(){
        List<Camping_Item__c> items = [select name, ID, Price__c, Quantity__c, Packed__c from Camping_Item__c ];
        return items;
    }
    
    @Auraenabled
    public static Camping_Item__c saveItem(Camping_Item__c item){
        upsert item;
        return item;
    }
}