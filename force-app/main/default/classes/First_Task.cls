public class First_Task {
    public Contact c {set;get;}
    public List<Opportunity> opList {set;get;}
    public List<Case> cList {set;get;}
    public First_Task(){
        c=new Contact();
        opList=new List<Opportunity>();
        cList=new List<Case>();
    }
    public void call(){
        c=[select id,lastName from Contact where id=:ApexPages.currentPage().getParameters().get('Id')];
        opList=[select id,name,closeDate,stageName,AccountId from Opportunity where ContactId=:c.id];
        cList=[select id,status,origin,AccountId,ContactId from Case where ContactId=:c.id];
    }
}