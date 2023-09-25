public class Vf_Lightning {
  @AuraEnabled 
  public static List<Account> call(){
        List<Account> accounts=[select Id,Name,Rating,Industry from Account];
        return accounts;
    }
}