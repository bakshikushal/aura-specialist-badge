Public Class AnimalLocator{    
    Public Static String getAnimalNameById(Integer anId){
        object animalName;
        Http http = new Http();
        HttpRequest req = new Httprequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + anId);
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        Map<String, Object> animalres = (Map<String, Object>) results.get('animal');        
        animalName = animalres.get('name');        
        return (String) animalName;
    }   
}