public with sharing class Account_Insert {// conflicts star1
    //changes from star2
    @AuraEnabled(cacheable=true)
    public static void create(String name,String rating,String phone) {
        Account a=new Account();
        a.Name=name;
        a.Rating=rating;
        a.Phone=phone;
        insert a;
    }
    //star1 branch changes
}