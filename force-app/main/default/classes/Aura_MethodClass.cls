public class Aura_MethodClass {
 @AuraEnabled
    public static id call(String name,string rating,string phone){
       
        Account acc=new Account();
        acc.Name=name;
        acc.Rating=rating;
        acc.Phone=phone;
        insert acc;
       return acc.Id;
    }
}