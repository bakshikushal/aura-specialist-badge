@isTest
global class ParkServiceMock implements WebServiceMock  {
	
    global void doInvoke(Object stub, Object request,Map<String, Object> response, String endpoint,String soapAction,String requestName,
                         String responseNS,String responseName,String responseType){
                         	ParkService.byCountryResponse  parks = new ParkService.byCountryResponse ();
                         	System.debug('parks-->'+ parks);
                            System.debug('parks.return_x-->'+parks.return_x);
							System.debug('parks.return_x-->'+parks.return_x);
							String[] parkString = new String[5];
                            parkString[0] = 'Anamudi Shola National Park';
                            Parks.return_x = parkString;
							System.debug('parks.return_x-->'+Parks.return_x);

                            //Parks.return_x resp;
                                //resp.add('Anamudi Shola National Park') ;
                         	//Parks.return_x[2] = 'Anshi National Park' ;
                            //Parks.return_x[3] = 'Bandipur National Park'  ;  
                         	response.put('response_x', parks);
                         }
}