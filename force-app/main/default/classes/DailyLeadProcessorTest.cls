@istest
public class DailyLeadProcessorTest {

    @istest
    static void testLeadsSchJob(){
		List<Lead> ldsList = new List<Lead>();
        for (integer i=0; i<200; i++){
            ldsList.add(new Lead(firstname='test first'+i, lastname='test last'+i, company='test Comp'));
        }
        insert ldsList;
        DailyLeadProcessor schjob = new DailyLeadProcessor();
        String CRON_EXP = '0 0 0 15 3 ? 2022';
        test.startTest();
		ID jobID = system.schedule('test job',CRON_EXP , schjob);
        test.stopTest();
    	integer ldsCount = [select count() from Lead where leadsource = 'Dreamforce'];
        system.assertEquals(200, ldsCount);
    }
}