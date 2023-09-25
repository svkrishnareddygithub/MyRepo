global class BatchApex_AccUpdate implements Database.Batchable<sObject>{
    global integer i=0;
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query='select Id,Name,Phone,Email__c,(select id,lastName,email,MobilePhone from Contacts) from Account';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc, List<Account> accList){
        //List<Contact> conList=new List<Contact>();
        for(Account a: accList){
             /*  if(a.Phone!=null && a.Email__c!=null){
                   for(Contact c: a.Contacts){
                        c.MobilePhone=a.Phone;
                        c.Email=a.Email__c;
                        conList.add(c);
                     }
                 }
            */
            a.Description='stateful test with interface and';
            i+=1;
        }
           System.debug(i);
         update accList;
    }
    global void finish(Database.BatchableContext bc){
        Messaging.singleEmailMessage msg=new Messaging.singleEmailMessage();
    }
    
}