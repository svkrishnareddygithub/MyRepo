trigger AccPhone_ConPhone on Contact (before insert) {
    List<Account> accList=[select id,name,Phone from Account];
    for(Contact c: trigger.new){
        if(c.AccountId!=null){
            for(Account a: accList){
                if(c.AccountId==a.Id){
                    c.Phone=a.Phone;
                }
            }
        }
    }
}