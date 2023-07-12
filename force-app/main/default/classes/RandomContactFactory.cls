public class RandomContactFactory {

    public static list<Contact> generateRandomContacts (integer noOfContacts, string conlastName){
        list<contact> conList = new list<Contact>();
        for (integer x=0; x<noOfContacts; x++){
            Contact con = new Contact();
            con.LastName = conlastName;
        	con.FirstName = 'TestContact ' + String.valueOf(x);
         	conList.add(con);   
        }
        return conList;
    }
}