public class Search_text {
    public String accName{set;get;}
    public list<Account> account{set;get;}
    public Search_text(){
        account=new List<Account>();
    }
    public void search_text(){
        
       account =[select id,name,phone,rating,email__c from Account where name =:accName OR phone=:accName OR email__c=:accName];
        if(account.size()>0){
            account =[select id,name,phone,rating,email__c from Account where name =:accName OR phone=:accName OR email__c=:accName];
        }else{
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.ERROR,'No records found');
            ApexPages.addMessage(msg);
        }
     
    }
}