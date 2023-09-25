public class Extention_Acc {
    public Account acc {set;get;}
    public Contact con {set;get;}
    public Opportunity op {set;get;}
    public Extention_Acc(ApexPages.StandardController controller){
        acc=(Account)controller.getRecord();
        con=new Contact();
        op=new Opportunity();
    }
    public PageReference call(){
        PageReference p;
        List<Account> accounts=[select id,name from Account where id =: acc.id];
        integer count=accounts.size();
        if(count<0){
                Account a=new Account();
                a.Name=acc.Name;
                a.Phone=acc.Phone;
                a.Type=acc.Type;
                a.AccountSource=acc.AccountSource;
            insert a;
            Contact c=new Contact();
            c.Id=acc.Id;
            insert c;
            Opportunity o=new Opportunity();
            o.id=acc.Id;
            insert o;
            p=new PageReference('/'+a.Id);
            
        }else{
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.ERROR,'duplicates found');
            ApexPages.addMessage(msg);
            p=null;
        }
        return p;
    }
}