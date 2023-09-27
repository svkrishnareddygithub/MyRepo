public with sharing class Account_Insert {
    //changes from star2
    @AuraEnabled(cacheable=true)
    public static void create(String name,String rating,String phone) {
        Account a=new Account();
        a.Name=name;
        a.Rating=rating;
        a.Phone=phone;
        insert a;
    }
}