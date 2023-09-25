trigger Shiva_Trigger on Opportunity (after update,after insert) {
    
     set<Id> oppids = new set<Id>();
    List<Account> acc = new List<Account>();
    for (Opportunity o:trigger.new)
    {
        if(o.AccountId!=null)
        oppids.add(o.AccountId);
    }
    
    List<Account> fetchaccopp = [select id, Name,Rating,(SELECT ID,AccountId from Opportunities) from Account where id=:oppids];
    
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        for(Opportunity opp : Trigger.new)
        {
            if(opp.StageName =='Closed Won')
            {
              for(Account acc1:fetchaccopp) 
              {
                  if(acc1.Id==opp.AccountId)
                  {
                      acc1.Rating ='Hot';
                      acc.add(acc1);
                  }
              }
            }
        }
    }
    update acc;
}
    
    /*	
    set<Id> ids=new set<Id>();
    for(Opportunity o:trigger.new)
    {
        if(o.AccountId!=null)
        ids.add(o.AccountId);
    }
    List<Account> accList=[select id,name,annualRevenue,(select id,amount from Opportunities) from Account where Id in:ids];
    List<Account> updateList=new List<Account>();
    for(Account a:accList)
    {
	    a.AnnualRevenue=0;
        for(Opportunity oo:a.opportunities)
        {
            if(oo.Amount!=null)
            a.AnnualRevenue+=oo.Amount;
        }
        updateList.add(a);
    }
    update updateList;
 }   
    

  By using Map
    Map<Id,Account> accMap=new Map<Id,Account>([select id,name,description from Account]);
    List<Account> liUpdate=new List<Account>();
    for(Opportunity o: trigger.new)
    {	
        if(o.stageName=='Closed Won')
        {
            Account a=accMap.get(o.AccountId);
            a.Description='40';
            liUpdate.add(a);
        }
    }
    update liUpdate;
    
    	
     // Without Map
      Set<Id> accIds=new Set<Id>();
      for(Opportunity o: trigger.new)
        {
            if(o.stageName=='Closed Won')
            {
                accIds.add(o.AccountId);
            }
        }
    List<Account>liUpdate=new List<Account>();
    for(Id i:accIds){
        Account acc=new Account();
        acc.Id=i;
        acc.description='30';
        liUpdate.add(acc);
    }
    update liUpdate;
*/