Public Class JobSearchController{

    Public List<Position__c> positionList = new List<Position__c>() ;
    Public String Keyword{get; set;}
    Public String SelectedDept {get; set;}
    Public String Selectedloc {get; set;}
  
    Public List<SelectOption> DeptOptions = new List<SelectOption>{
        new selectOption('0', 'All Depts'),
        new selectOption('Engineering', 'Engineering'),
        new selectOption('IT', 'IT'),
        new selectOption('Support', 'Support' )} ;
    
    Public  List<SelectOption> getDeptOptions(){
        return DeptOptions;
    }      
    
    Public List<SelectOption> LocOptions = new List<SelectOption> {
        new SelectOption('0' , 'All Locs'),
        new SelectOption('Mumbai' , 'Mumbai'),
        new SelectOption('Delhi' , 'Delhi')} ;
    
    Public  List<SelectOption> getLocOptions(){
        return LocOptions;
    }          
    
    Public PageReference searchpositionList(){
    if (SelectedDept == '0' || SelectedDept == '')
        SelectedDept = '%' ;
    if (Selectedloc == '0' || Selectedloc == '')
        Selectedloc = '%' ;    
    positionList = [select name, ID, Location__c, Department__c, Educational_Requirement__c,
                   Hiring_Manager__c, Location_City_State__c, Start_Date__c 
                   from position__c p
                   where Department__c LIKE :SelectedDept AND location__r.name LIKE :Selectedloc];
    return null;
    }
    
    Public List<Position__c> getpositionList(){
    return positionList;
    }


}