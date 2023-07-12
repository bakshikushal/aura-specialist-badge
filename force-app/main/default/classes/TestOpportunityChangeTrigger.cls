@isTest
public class TestOpportunityChangeTrigger {

    @isTest
    static void testCreateAndUpdateOpportunity(){
        Test.enableChangeDataCapture();
        Opportunity opp = new Opportunity();
        opp.name = 'Sell 100 Widgets';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today().addMonths(3);
        insert opp;
        Test.getEventBus().deliver();
        Opportunity[] oppRecords = [SELECT Id,StageName FROM Opportunity];
		Opportunity oppUpdated = oppRecords[0];
        oppUpdated.StageName = 'Closed Won';
        update oppUpdated;
        Test.getEventBus().deliver();
        Task[] taskList = [SELECT Id,Subject FROM Task];
		System.assertEquals(1, taskList.size(), 'The change event trigger did not create the expected task.');
    }
}