public class Retrive_AccData {
    @AuraEnabled
   public static List<Contact> call(String accName){
       List<Contact> conList=[select Id,LastName,FirstName,Email from Contact where Account.Name=:accName];
       return conList;
   }
}