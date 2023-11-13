public with sharing class Acc_Con_List {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
      return [select Id,Name,Rating,Phone,Industry from Account];
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(List<Id> accId){
       
        List<Contact> listCon= [select Id,LastName,FirstName,Email,AccountId from Contact where AccountId IN :accId];
        
        system.debug(listCon.size()); 
     return listCon ;
   // sharoooq changesss
    }
}