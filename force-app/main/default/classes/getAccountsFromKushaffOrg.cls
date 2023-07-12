public with sharing class getAccountsFromKushaffOrg {

    @AuraEnabled
    public static list<Account> getAccRecordsFromKushaff(){
        //Create Session ID
        partnerAuth.Soap req = new partnerAuth.Soap();
        partnerAuth.LoginResult res = req.login('bakshi.kushal24@gmail.com', 'January@2020PXAh0OJlmsoeoz0KxEkqBatcr');
        String sId = res.sessionId;
        //System.debug('Session ID: '+ sId);

        //Attach the session Id in the session header element which is used by our main server Class object accObj below
        getSourceAccounts.SessionHeader_element head = new getSourceAccounts.SessionHeader_element();
        head.sessionId = sId;

        // Create an instance and call the Server method accData from server class GetAccountData
        getSourceAccounts.GetAccountData accObj = new getSourceAccounts.GetAccountData();
        accObj.SessionHeader = head;
        String response = accObj.accData();
        //System.debug('Response from Server '+ response);
        list<Account> accList = (list<Account>) JSON.deserialize(response, list<Account>.class);
        //System.debug('Deserialized Accounts: '+ accList);
        //System.debug('Total Accounts returned: '+ accList.size());
        return accList;
    }

}