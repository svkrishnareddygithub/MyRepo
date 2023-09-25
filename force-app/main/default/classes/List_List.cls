public class List_List {
    public List<Account> accList  {set;get;}
    public List_List(){
        accList=[select id ,Name from Account limit 5];
    }
}