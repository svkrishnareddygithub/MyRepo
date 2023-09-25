public class ConditionalSearch_First {
    public String accName    {set;get;}
    public String accEmail   {set;get;}
    public List<Account> accList {set;get;}
    public Account acc {set;get;}
    public ConditionalSearch_First(){
        accList=new List<Account>(); 
    }
    
    public void call(){
          
        if(accName != '' && accEmail!= ''){
            accList=[select id,name,email__c from Account where name=:accName AND email__c=:accEmail ];
        }else if(accName != '' && accEmail==''){
            accList=[select id,name,email__c from Account where name=:accName];
        }else if(accName=='' && accEmail!=''){
            accList=[select id,name,email__c from Account where email__c=:accEmail];
        }else {
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.ERROR,'Records not found');
            ApexPages.addMessage(msg);
        }
    }
    public void pdf(){
       acc=[select id,name,Email__c,Phone from Account where id=:ApexPages.currentPage().getParameters().get('id')]; 
    }
}