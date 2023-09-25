public class Apex_Class {
    @auraEnabled
    public static  String create(String name,String phone,String industry){
        Account acc=new Account();
        acc.Name=name;
        acc.Phone=phone;
        acc.Industry=industry;
        insert acc;
        return ''+acc.Id;
    }
}