public class Account_AddMe {//changes from star2
    public List<Account> accList {set;get;}
    public Account a       {set;get;}
    public Account_AddMe(){//1
        accList=new List<Account>();
        call();
    }//changes from star1 branch
    public void call(){
        a=new Account();
       accList.add(a);
       //localbranch changes
    }
}

//star2 changes