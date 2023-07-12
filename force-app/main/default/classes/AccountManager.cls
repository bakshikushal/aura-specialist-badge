@RestResource(URLMapping='/Accounts/*')
global class AccountManager{
    @HttpGet
    global static Account getAccount(){
        RestRequest req = RestContext.request;       
        system.debug('Before testing URI IS: ' +req.requestURI);
        String str = req.requestURI.substring(req.requestURI.lastIndexOf('/')-18);
        String AccID = Str.substring(0,18);
        system.debug('Before running query: Id is ' +AccID);
        Account returnAcc = new Account();
        returnAcc = [select name, ID, (select name, ID from contacts) from Account where ID = :AccID];
        system.debug('We are here:' +returnAcc);
        system.debug('After query still in try');    
        for (contact con : returnAcc.contacts){
            system.debug('contact: ' +con);
        }
        return returnAcc;    
    }
    
}