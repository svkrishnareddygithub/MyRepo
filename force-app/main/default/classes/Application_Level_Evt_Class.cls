public class Application_Level_Evt_Class {
  @AuraEnabled
    public static List<Contact> getContacts(String name){
        Account accList=[select id,name from Account where name=:name];
        List<Contact> conList=[select id ,LastName from Contact where AccountId =: accList.id];
        return conList;
    } 
}