public with sharing class Account_Insert {
    @AuraEnabled(cacheable=true)
    public static void create(String name,String rating,String phone) {
        Account a=new Account();
        a.Name=name;
        a.Rating=rating;
        a.Phone=phone;
        insert a;
    }
}