public class Account_Wrapper {
   public List<Account_Wrap> accounts {set;get;}
    public Account_Wrapper(){
        accounts=new List<Account_Wrap>();
        List<Account> listAcc=[select id,name ,phone from Account ];
        for(Account a: listAcc){
            Account_Wrap ac=new Account_Wrap();
            ac.acc=a;
            ac.flag=false;
            accounts.add(ac);
          }
    }
    
 public class Account_Wrap{
        public Account acc  {set;get;}
        public boolean flag  {set;get;}
    }
}