trigger OpportunityLineItem on OpportunityLineItem (after insert) {
    /*
       set<Id> ids=new set<Id>();
        for(OpportunityLineItem v: trigger.new){
            if(v.OpportunityId!=null){
                ids.add(v.OpportunityId);
            }
        }
    set<Id> idss=new set<Id>();
    for(Opportunity o: [select id,name,stageName,AccountId from Opportunity where id in: ids]){
        if(o.AccountId!=null){
            idss.add(o.AccountId);
        }
    }
    List<Messaging.Email> email=new List<Messaging.Email>();
    for(Account a: [select id,name,email__c from Account where Id In: idss]){
        for(Opportunity  n: [select id,name,stageName,AccountId from Opportunity where id in: ids]){
            if(n.accountId==a.Id){
                for(OpportunityLineItem io: trigger.new){
                    if(io.opportunityId==n.id){
                          Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
                          msg.setToAddresses(new List<String>{a.Email__c});
                          msg.setPlainTextBody('Hi' +a.Name+ 'your Product details ProductName' +io.name+ 
                                               'ProductCode' +io.ProductCode+ 'Quantity' +io.Quantity );
                        email.add(msg);
                    }
                }
            }
        }
    }
    Messaging.sendEmail(email);
    */
    
}