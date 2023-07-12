Public Class positionExtension{

    Private final Position__c position;
    Public String positionTypeID {get; set;}
    
    Public positionExtension(ApexPages.StandardController positionController){
    this.position = (position__c)positionController.getRecord();
    positionTypeID  = position.position_type__c;
    }
    
    Public List<selectOption> positionTypeOptions {
    get{
        List<selectOption> positionTypes = new List<selectOption>();
        for (position_type__c ptr :[select name from position_type__c pt
                                    where pt.department__c = :position.department__c 
                                    order by name]  )
                positionTypes.add(new selectoption(ptr.id, ptr.name))  ;
        if(position.department__c != null) {
            positionTypes.add(new selectoption('other', 'other'))  ;
        }
        else{
            positionTypes.add(new selectoption('', 'Please select a DEPT', true))  ;
        }  
        return  positionTypes;
    }
    Private set;}
    
    public position_type__C newPositionType{
    get{
        if(newPositionType != NULL ){
           newPositionType = new position_type__c();
        }   
        return newPositionType ;         
    }
    private set;
    }

}