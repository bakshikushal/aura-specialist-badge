@isTest
public class AnimalLocatorTest {
    @isTest 
    static void testanimals(){
        integer anID = 1;
        Test.setMock(HTTPCalloutMock.class, new AnimalLocatorMock());
        String res = AnimalLocator.getAnimalNameById(anID);
        system.debug(res);
        system.debug(anID);
        system.assertEquals(res, 'chicken');
        system.assertnotEquals(res, '');
    }
}