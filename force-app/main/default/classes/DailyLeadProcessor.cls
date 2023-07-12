public class DailyLeadProcessor implements schedulable{
    
    public void execute(system.SchedulableContext sc){
    list<lead> ldsList = new list<Lead>();
    for (Lead ld: [select name, ID, leadsource from Lead where leadsource = NULL LIMIT 200]){
        ld.leadsource = 'Dreamforce';
        ldsList.add(ld);
    }
    update ldsList;
  }
    
}