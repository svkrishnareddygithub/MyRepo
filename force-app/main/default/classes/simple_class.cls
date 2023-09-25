public with sharing class simple_class {
   @AuraEnabled(cacheable=true)
  public static List<Contact> getContacts(String name){
    Account  acc=[select Id,Name,Rating,Phone from Account WHERE Name=:name ];
    return [select Id,LastName,FirstName,Email,AccountId from Contact WHERE AccountId=:acc.Id];
  }
}