public class NaveenM_Task {
    public void call(){
        List<Contact> conList=[select id,lastName,Account.Name from Contact where AccountId!=null];
        for(Contact c: conList){
        System.debug(c.Account.Name);
        }
    }
}