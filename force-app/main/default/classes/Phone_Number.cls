public class Phone_Number {
    public void call(){
        List<Account>accList=[select id,name,phone from Account limit 5];
        List<Account> acc=new List<Account> ();
        for(Account a: accList){
            a.Phone=a.Phone+1;
            System.debug(a.Phone);
            acc.add(a);
        }
        update acc;
    }
}