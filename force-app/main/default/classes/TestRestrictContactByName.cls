@istest
public class TestRestrictContactByName {

    @istest
    public static void testInsertErr(){
        Contact con = new Contact(lastName='INVALIDNAME');
        test.startTest();
        database.SaveResult svr = database.insert(con,false);
        test.stopTest();
        system.assert(!svr.isSuccess());        
    }
    @istest
    public static void testInsertSucc(){
        Contact con = new Contact(lastName='NOTINVALIDNAME');
        test.startTest();
        database.SaveResult svr = database.insert(con,false);
        test.stopTest();
        system.assert(svr.isSuccess());        
    }
    @istest
    public static void testUpdateErr(){
        Contact con = new Contact(lastName='NOTINVALIDNAME');
        database.SaveResult svr = database.insert(con,false);
        con.lastname= 'INVALIDNAME';
        test.startTest();
        database.SaveResult upd = database.update(con,false);
        test.stopTest();
        system.assert(!upd.isSuccess());        
    }
}