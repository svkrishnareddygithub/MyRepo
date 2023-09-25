trigger Totl_Amt_Opp_Acc on Contact (after update) {
    list<Account> lAcc=[select id,name from Account];
    List<Account> accList=new List<Account>();
    List<Contact>co=[select id,lastName,(select id,amount,AccountId from Opportunities),AccountId from Contact where Id in:trigger.new];
    for(Contact c: co){
       List<Opportunity> oList=c.Opportunities;
        Decimal total=0;
        for(Opportunity o: oList){
            if(o.Amount!=null){
            total+=o.Amount;
            } 
        }
        for(Account a: lAcc){
            if(a.Id==c.AccountId){
                a.Total_Opp_Amount__c=total;
                accList.add(a);
            }
      }
    }
    update accList;
}