public class Third_Fourth {
    public String name              {set;get;} 
    public List<Account> accList    {set;get;}
    public Account act              {set;get;}
    public Third_Fourth(){
        accList=new List<Account>();
    }
    public void call(){
        accList=[select id ,name,email__c from Account where name=:name];
    }
    public PageReference invoke(){
        PageReference p; 
        act=[select id,name from Account where id=:ApexPages.currentPage().getParameters().get('id')];
        List<Opportunity> opList=[select id,Name,closeDate from Opportunity where AccountId =:act.Id];
        List<Contact> conList=[select id,lastName from Contact where AccountId =:act.id];  
                if(opList.size()<=0 && conList.size()<=0 ){
                    Opportunity o=new Opportunity();
                    o.Name='refregirator';
                    o.CloseDate=system.today();
                    o.StageName='prospecting';
                    o.AccountId=act.Id;
                    insert o;
                    Contact c=new Contact();
                    c.lastName='krishna Prakash';
                    c.AccountId=act.Id;
                    insert c;                            
                    p=new PageReference('/'+act.Id); 
                 }    
                else{
                    update act;
                    ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.ERROR,'Account is Updated,Account has Opportunity and Contact ');
                    ApexPages.addMessage(msg);
                }
            return p;
    }
}