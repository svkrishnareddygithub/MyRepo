public class ContactList {
  @AuraEnabled
   public static List<Contact> data(String accId){
       List<Contact> conList=[select Id,LastName,FirstName,Email from Contact where AccountId=:accId];
       return conList;
   }
}