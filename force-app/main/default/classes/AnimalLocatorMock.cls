@isTest
global class AnimalLocatorMock implements HTTPCalloutMock {
    global HTTPResponse respond(HTTPrequest req){
        
        HTTPResponse res = new HTTPresponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}');
        res.setStatusCode(200);
        return res;
    }
}