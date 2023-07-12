@isTest
public class ParkLocatorTest {
    @isTest static void testparks(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String ctry = 'India';
        List<String> ctryParks = ParkLocator.country(ctry);
        system.assertEquals(ctryparks[0], 'Anamudi Shola National Park');        
    }
}