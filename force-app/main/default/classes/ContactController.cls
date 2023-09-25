public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {

            List<Contact> con=[select Id,LastName,FirstName,Email from Contact]; 
          if(con.size()<=0){
            throw new AuraHandledException('Forced error');
          }
       return con;
    }
}