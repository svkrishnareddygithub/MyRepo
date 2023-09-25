public class ProcessBuilder {
   public void call(){
   List<Account> acc=[select id ,name,description from Account where name='krishna' ];
   List<Account> accList=new List<Account>();
    for(Account a: acc){
        a.Description='this is for processbuilder';
        accList.add(a);
    }
        update accList;
    }
}