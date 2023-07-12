Public Class dynamicListMaps{

    Public List<String> people{
    get {
            return new list<String>{'Kush', 'Shaff'};
        }
    set ;    
    }
    
    Public list<integer> iter{
    get {
            return new List<integer> {0,1};
        }
    set ;
    } 
    
    Public map<String, String> Ppl_Map {
    get {
       Ppl_Map = new map<String, String>{
        'Kush' => 'shaff',
        'luv' => 'Pam'};
       return ppl_map; }
    set;
    }   
}