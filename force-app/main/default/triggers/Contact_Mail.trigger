trigger Contact_Mail on Contact (after insert,after update) {
   /*  List<Contact> conList=trigger.new;
    Account acc=[select Id,Name,Rating,Phone from Account];
   List<String> emails=new List<String>();
    for(Contact c: conList){
        emails.add(c.Email);
    }

     Id ids='';
     Account acc=[select id,name,rating from Account where Id=:ids limit 1];
     for(Contact c : trigger.old){
        if(c.AccountId!=null){
            ids=c.AccountId;
        }
        if(acc.Rating=='Hot'){
          c.addError('u cont delete'); 
        }
    }

    List<Account> accList=new List<Account>();
    for(Contact c: trigger.new){
        if(c.AccountId!=null && c.phone!=null){
           Account acc=new Account();
            acc.id=c.accountId;
            acc.Phone=c.Phone;
            accList.add(acc);
        }
    }
    update accList;
    */
    // create a set to store account ids that need to be updated
    Set<Id> accountIdsToUpdate = new Set<Id>();
    
    // loop through the contacts
    for (Contact c : Trigger.new) {
        // check if the contact has a 'Hot' rating
        if (c.leadsource == 'Web') {
            // add the account id to the set
            accountIdsToUpdate.add(c.AccountId);
        }
    }
    
    // update the account records
    if (!accountIdsToUpdate.isEmpty()) {
        List<Account> accountsToUpdate = new List<Account>();
        for (Id accountId : accountIdsToUpdate) {
            Account a = new Account(
                Id = accountId,
                Rating = 'Hot'
            );
            accountsToUpdate.add(a);
        }
        update accountsToUpdate;
    }
}