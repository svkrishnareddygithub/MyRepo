public class Array_Account {
    public list<selectOption> options {set;get;}
    public List<Account> accList {set;get;}
    public List<String> sList  {set;get;}
    
    public Array_Account(){
        options=new List<selectOption>();
        sList =new List<String>();
        accList=new List<Account>();
        
    }
    public void call(){
        accList=[select id,name from Account];
        for(Account a: accList){
            sList.add(a.name);
        }
        for(String s: sList){
            options.add(new selectOPtion(s,s));
        }
    }
}