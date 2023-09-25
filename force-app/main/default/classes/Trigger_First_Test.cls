@isTest
public class Trigger_First_Test {
    static testMethod void call(){
        Account a =new Account();
        a.name='krishna';
        a.Email__c='abc@gmail.com';
        a.Phone='8096575451';
        insert a;
        Account a1=new Account();
        a1.Name='anji';
        a1.Email__c='abc@gmail.com';
        a1.Phone='8096575451';
        insert a1;
    }
    
    static testMethod void invoke(){
        Account a=new Account(name='krishna');
        insert a;
        Contact c=new Contact(lastName='krishnan',AccountId=a.Id);
        insert c;
        update a;
        delete c;
    }
}