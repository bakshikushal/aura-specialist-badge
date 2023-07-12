Public Class ControllerExtensionClass{

    Public Account acc {get; set;}
    
    Public ControllerExtensionClass(ApexPages.standardController std){
        this.acc = (Account)std.getRecord();   
    }
    
    Public String getGreeting(){
        return 'HELLO : ' + acc.name ;
    }       
    

}