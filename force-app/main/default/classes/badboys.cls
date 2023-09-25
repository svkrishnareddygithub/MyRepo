public class badboys {
    public void call(){
        List<Account> accList=[select Id,name,rating,phone from Account limit 5];
        delete accList;
    }
}