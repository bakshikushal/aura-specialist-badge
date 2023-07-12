@istest
public class LeadProcessorTest {

    @testsetup
    public static void createTestLeads(){
        List<Lead> ldsList = new List<Lead>();
        for (integer i=0; i<200; i++){
            ldsList.add(new Lead(firstname='test first'+i, lastname='test last'+i, company='test Comp'));
        }
        insert ldsList;
    }
    
    @istest 
    public static void testLeadsBatch(){
        LeadProcessor lds = new LeadProcessor();
        test.startTest();
        Id batchJobId= Database.executeBatch(lds);
        test.stopTest();
        integer count = [select count() from Lead where leadsource = 'Dreamforce'];
        system.assertEquals(200, [select count() from Lead where leadsource = 'Dreamforce']);
    }
}