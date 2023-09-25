public class Show_Phone {
    public List<Account> accList  {set;get;}
   // public Account acc            {set;get;}
    public boolean flag           {set;get;}
    
    public void call(){
        accList=[select id ,name,phone,CustomerPriority__c from Account];
        for(Account a: accList){
            if(a.CustomerPriority__c=='High'){
             	  flag=true;
            }else if(a.CustomerPriority__c=='Low' || a.CustomerPriority__c=='Medium' || a.CustomerPriority__c==null){
                a.Phone=NULL;
            }
        }
    }
}