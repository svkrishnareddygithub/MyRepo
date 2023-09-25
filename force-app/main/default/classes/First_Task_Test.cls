@isTest
public class First_Task_Test {
    static testMethod void call(){
        Contact c=new Contact();
        c.LastName='krishna';
        insert c;
        Opportunity o=new Opportunity();
        o.Name='ac';
        o.StageName='prospecting';
        o.CloseDate=system.today();
        o.ContactId=c.Id;
        insert o;  
        Case cs=new Case();
        cs.Origin='mail';
        cs.Status='new';
        cs.Priority='high';
        cs.ContactId=c.Id;
        insert cs;
      /* List<Opportunity> opList=[select id,name,closeDate,stageName,AccountId from Opportunity where ContactId=:c.id];
       List<Case> cList=[select id,status,origin,AccountId,ContactId from Case where ContactId=:c.id];*/
        First_Task f=new First_Task();
          ApexPages.currentPage().getParameters().put('Id',c.id);
        f.call();
     //   System.assertEquals(opList.size(), f.opList.size());
        
    }
}