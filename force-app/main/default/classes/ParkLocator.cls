public class ParkLocator {
	
    public static List<String> country(String ctry){
       ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
       List<String> countryparks =  parks.byCountry(ctry);
       return countryparks;
    }
}