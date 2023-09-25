trigger Trigger_Second on Account (after update) {
   /* List<Account>accList=[select id,name from Account];
    for(Account a: trigger.old){
        List<Contact> conList=[select id,lastName from Contact where AccountId=:a.Id];
        if(conList.size()>0){
            delete conList;
        }
    }
  
    if(trigger.isbefore){
       Invoke_Trigger_Second.call(trigger.oldMap, trigger.newMap);
    }
*/
    List<Contact> co=new List<Contact>();
    List<Account> v=trigger.new;
    for(Account a: [select id,name,(select id,lastName from Contacts) from Account where id In: v]){
        Account ab=trigger.oldMap.get(a.Id);
            if(a.Name!=ab.Name){
              for(Contact c: a.contacts){
                 co.add(c);
        }
     }
    }
    delete co;
}