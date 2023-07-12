global with sharing class GetAccRecordsRestService {
    @AuraEnabled
    public static list<Account> getAccRecordsUsingRest(String city, String ind){
        System.debug('Calling Rest for city & IND'+ city + ' ' + ind);
        HttpRequest hreq = new HttpRequest();
        Http h = new Http();
        
        //Set the End point. This contains the grant type = password, client id, client secret, username/passwd 
        hreq.setEndpoint('https://kushaff-dev-ed.my.salesforce.com/services/oauth2/token?grant_type=password&client_id=3MVG9ZF4bs_.MKuhG603Pj2WnuJVE6YaavBJ.K7iKxzkjJ51HYiX0aU0KNG6.toxIWG0pvVftk4R3863QonCu&client_secret=0C0EF89E285F949A5F4B796BD8E5F8B73EE6D7100391C7524B042D0956E6C535&username=bakshi.kushal24@gmail.com&password=January@2020PXAh0OJlmsoeoz0KxEkqBatcr');
        hreq.setMethod('POST');
        HttpResponse hresp = h.send(hreq);
        System.debug('Response : '+ hresp);
       
        String response = hresp.getBody();
       
        Map<String,Object> respMap = (Map<String,Object>) JSON.deserializeUntyped(response);
       	System.debug('Response Map : '+ respMap);
        
        String accessToken = (String) respMap.get('access_token');
        
        System.debug('access token : '+ accessToken);
        
        //Now that we have the access token, lets call the REST service from source
        hreq.setMethod('GET');
        hreq.setHeader('Authorization','Bearer '+ accessToken );
        hreq.setHeader('Content-Type', 'application/json');
        String endpoint = 'https://kushaff-dev-ed.my.salesforce.com/services/apexrest/accountsData';
        //hreq.setEndPoint('https://kushaff-dev-ed.my.salesforce.com/services/apexrest/accountsData');
        if(!String.isBlank(city) && String.isBlank(ind)){
            endpoint = endpoint + '?city='+city  ;
        }
        if(!String.isBlank(ind) && String.isBlank(city)){
            endpoint = endpoint + '?ind='+ind ;
        }
        
        if(!String.isBlank(ind) && !String.isBlank(city)){
            endpoint = endpoint + '?ind='+ind ;
            endpoint = endpoint + '&city='+city;            
        }
        system.debug('End Point to call Rest : '+ endpoint);
        hreq.setEndpoint(endpoint);
        hresp = h.send(hreq);

        System.debug('Response : '+ hresp);
        String Restresponse = hresp.getBody();
        system.debug('Rest Response Body: '+Restresponse);
        
        list<Account> accList = (List<Account>) JSON.deserialize(Restresponse, List<Account>.class);
        return accList;
         
 
    }
}