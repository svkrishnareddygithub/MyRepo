public class Set_Account_Names {
    public set<String> s {set;get;}
    public Set_Account_Names(){
        s=new set<String>();
    }
    public void call(){
        List<Account> acc=[select id ,name from Account];
          for(Account a: acc){
             s.add(a.name);
          }
    }
}