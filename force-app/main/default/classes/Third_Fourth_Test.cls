@isTest
public class Third_Fourth_Test {
    static testMethod void call(){
        Account accc=new Account();
        accc.Name='ramakrishna';
        insert accc;
        /*Opportunity oppp=new Opportunity();
        oppp.Name='sanata';
        oppp.CloseDate=system.today();
        oppp.StageName='prospecting';
        oppp.AccountId=accc.id;
        insert oppp;
        Contact c=new Contact();
        c.lastName='djuniors';

        List<Account> acc=[select id,name from account where name=:accc.Name];
        Third_Fourth t=new Third_Fourth();
        t.call();
       */
        List<Account> acc=[select id,name from account];
        List<Opportunity> op=new List<Opportunity>();
        List<Contact> con=new List<Contact>();
        List<Account> aList=new List<Account>();
            for(Account a: acc){    
                   List<Opportunity> opList=[select id,Name,closeDate from Opportunity where AccountId =:a.Id];
                    List<Contact>  conList=[select id,lastName from Contact where AccountId =:a.id];
                if(opList.size()<=0 &&conList.size()<=0 ){
                    Opportunity o=new Opportunity();
                    o.Name='refregirator';
                    o.CloseDate=system.today();
                    o.StageName='prospecting';
                    o.AccountId=a.Id;
                    op.add(o);
                    Contact c=new Contact();
                    c.lastName='krishna Prakash';
                    c.AccountId=a.Id;
                    con.add(c);
                   PageReference p=new PageReference('/'+a.Id); 
                 }    
                else{
                    aList.add(a);
                }
          }
        if(op.size()>0 && con.size()>0){
            insert op;
            insert con;
        } else{
           update aList;
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.ERROR,'Account is Updated,Account has Opportunity and Contact ');
            ApexPages.addMessage(msg);
           }
        Third_Fourth tf=new Third_Fourth();
            tf.invoke();
    }
}