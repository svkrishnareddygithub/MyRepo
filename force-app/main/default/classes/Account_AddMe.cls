public class Account_AddMe {
    public List<Account> accList {set;get;}
    public Account a       {set;get;}
    public Account_AddMe(){
        accList=new List<Account>();
        call();
    }
    public void call(){
        a=new Account();
       accList.add(a);
    }
}