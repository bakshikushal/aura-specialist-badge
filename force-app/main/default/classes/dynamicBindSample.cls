Public Class dynamicBindSample{

    Public List<String> listOfFields{
        get { if (listOfFields == Null) {
                listOfFields = new list<String>();
                listOfFields.add('Industry');
                listOfFields.add('AnnualRevenue');
                listOfFields.add('Fax');
                
              }
             return listOfFields;
             }   
         Public set;       
         }
         
         Public dynamicBindSample(ApexPages.StandardController cont){
         cont.addfields(listOfFields);
         }
}