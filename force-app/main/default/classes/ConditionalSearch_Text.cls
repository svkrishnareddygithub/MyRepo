@isTest		
public class ConditionalSearch_Text {
  
    static testMethod void call(){
      Account acc=new Account();
        acc.name='krishna';
        acc.Email__c='abc@gmail.com';
        insert acc;
      List<Account> accList ;
        if(acc.Name != '' && acc.Email__c!= ''){
            accList=[select id,name,email__c from Account where name=:acc.Name AND email__c=:acc.Email__c];
        }else {
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.ERROR,'Records not found');
            ApexPages.addMessage(msg);
        }
        ConditionalSearch_First cs=new ConditionalSearch_First();
        cs.call();
       // ApexPages.currentPage().getParameters().get(acc.Id);
       // cs.pdf();
    }
    
    
    static testMethod void call1(){
        Account accc=new Account();
        accc.name='krishnareddy';
        insert accc;
      List<Account> accListt ;
         if(accc.Name != '' && accc.Email__c==''){
            accListt=[select id,name,email__c from Account where name=:accc.Name];
        }
        ConditionalSearch_First css=new ConditionalSearch_First();
        css.call();
       
    }
}