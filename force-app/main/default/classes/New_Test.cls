@isTest
public class New_Test {
    static testMethod void call(){
        Account acc=new Account();
        acc.name='krishna';
        insert acc;
        Contact c=new Contact();
        c.LastName='anji';
        c.accountId=acc.Id;
        insert c;
        Opportunity o=new Opportunity();
        o.Name='air conditioner';
        o.stageName='prospecting';
        o.CloseDate=System.today();
        o.accountId=acc.id;
        insert o;
        Acc_Con_Opp a=new Acc_Con_Opp();
        a.call();
    }
}