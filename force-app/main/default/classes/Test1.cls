@isTest
public class Test1 {
    static testMethod void call(){
        List<Account> accList=[select id ,name,phone,CustomerPriority__c from Account];
        boolean flag=false;
        for(Account a: accList){
            if(a.CustomerPriority__c=='High'){
             	 flag=true;
            }else if(a.CustomerPriority__c=='Low' || a.CustomerPriority__c=='Medium' || a.CustomerPriority__c==null){
                a.Phone=NULL;
            }
        }
        Show_Phone s=new Show_Phone();
        s.call();
    }
}