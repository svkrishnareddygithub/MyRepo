@isTest
public class Sixth_Test {
   static testMethod void call(){
        Account acc=new Account();
        acc.name='krishna';
        insert acc;
        Contact c=new Contact();
       c.LastName='manish';
       c.AccountId=acc.Id;
       insert c;
        
        Sixth_Task s=new Sixth_Task();
       ApexPages.currentPage().getParameters().get(c.Id);
        s.nextA();
    }
  }