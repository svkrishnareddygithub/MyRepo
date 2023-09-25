public class Account_List {
    public List<Account> accList {set;get;}
    public  Account_List(){
       accList =[select id,name,type,AccountNumber from Account];
    }  
}