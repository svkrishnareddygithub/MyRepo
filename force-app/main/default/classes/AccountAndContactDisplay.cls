public class AccountAndContactDisplay {
    public List<Account> accList {set;get;}
    public list<Integer> li {set;get;}
    public AccountAndContactDisplay(){
        accList=new List<Account>();
        List<Account> listAcc=[select id,name,phone,rating,(select id,lastName,firstName from Contacts) from Account];
        for(Account a:listAcc){
           integer c=a.contacts.size();
            for(integer n=0;n<c;n++){
                accList.add(a);
            }
        }
    }
}