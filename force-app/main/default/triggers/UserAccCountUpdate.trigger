trigger UserAccCountUpdate on Account (after insert,after delete) {
  /*  if(trigger.isAfter && trigger.isInsert){
    List<Account> accList=[select id,Name,ownerId from Account];
    List<User> u=[select id,name from User];
    for(User i:u){
         i.Count__c=0;
        for(Account a: accList){
            if(a.ownerId==i.Id){
                i.Count__c++;
            }
        }
     }
    }
*/
}