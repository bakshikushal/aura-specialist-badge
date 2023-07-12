public with sharing class fetchAccRecords {

    @AuraEnabled(cacheable=true)
    public static List<Account> returnAccRecordsForInput(String inpCity, String inpInd){
        List<Account> accList = new List<Account>();
        System.debug('Calling APEX for City ' +inpCity +' And Ind ' + inpInd);
        
        if(String.isBlank(inpCity) && String.isBlank(inpInd)){
            accList =   [SELECT NAME, BILLINGCITY, INDUSTRY, PHONE, RATING FROM ACCOUNT];
        System.debug('In both blanks');
        }

        if(!String.isBlank(inpCity) && String.isBlank(inpInd)){
            String searchCity = '%' + inpCity + '%';
            accList =   [SELECT NAME, BILLINGCITY, INDUSTRY, PHONE, RATING FROM ACCOUNT where BILLINGCITY like :searchCity];
            System.debug('In only City ');
        }
        if(!String.isBlank(inpInd) && String.isBlank(inpCity)){
            String searchInd = '%' + inpInd + '%';
            accList =   [SELECT NAME, BILLINGCITY, INDUSTRY, PHONE, RATING FROM ACCOUNT where INDUSTRY like :searchInd];
            System.debug('In only Ind');
        }

        if(!String.isBlank(inpCity) && !String.isBlank(inpInd)){
            System.debug('In Both City Ind');
            String searchCity = '%' + inpCity + '%';
            String searchInd = '%' + inpInd + '%';
            accList =   [SELECT NAME, BILLINGCITY, INDUSTRY, PHONE, RATING FROM ACCOUNT where 
            BILLINGCITY like :searchCity and INDUSTRY like :searchInd];
        }        
        return acCList;
    }
}