trigger Opp_Dupli_Prevention on Opportunity (before insert) {
   /* for(Account a: [select id,name,(select id,name from Opportunities) from Account]){
        List<Opportunity> op=a.Opportunities;
        List<String> s=new List<String>();
        for(Opportunity l: op){
            s.add(l.name);
        }
        for(String d: s){
            for(Opportunity oo: trigger.new){
                if(oo.AccountId==a.Id){
                if(oo.Name==d){
                    oo.addError('duplicate Opportunity for this Account');
                } 
              }
            }
        }
    }

    set<Id> ids=new set<Id>();
    for(Opportunity o: trigger.new){
        ids.add(o.AccountId);
    }
    List<Opportunity> opp=[select id,name,AccountId from Opportunity  where AccountId in:ids ];
    for(Opportunity oo: opp){
        for(Opportunity o: trigger.new){
            if(oo.name==o.Name){
                o.addError('duplicate opportunity for this account');
            }
        }
    }
*/
 list<opportunity>old=[select id, name,accountId from opportunity]; 
     for(opportunity o:old){
          for(opportunity n:trigger.new){
             if(n.AccountId==o.AccountId){
                 if(n.Name==o.Name){
                    n.addError('duplicate');
                 }
             }
         }
    }
}