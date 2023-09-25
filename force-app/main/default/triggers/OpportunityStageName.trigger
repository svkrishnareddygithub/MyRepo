trigger OpportunityStageName on Opportunity (before update,after update,before insert,after insert) {
   /* for(Opportunity o: trigger.new){
        Opportunity oldOne=trigger.oldMap.get(o.Id);
        if( oldOne.stageName && o.StageName){
            o.Description='this is from trigger';
        }
    }
*/
    
    if((trigger.isInsert || trigger.isUpdate) && trigger.isBefore)
    {
        
        for(Opportunity o: trigger.new){
            if(o.stageName=='Closed Won'){
                o.description='ClosedWon Before';
            }
        }
    }
    if((trigger.isInsert || trigger.isUpdate) && trigger.isafter)
    {
        set<Id> ids=new Set<id>();
        for(Opportunity o:Trigger.new)
        {
            if(o.AccountId !=null)
            {
                ids.add(o.AccountId);
            }
        }
        Map<Id,Account> accMap=new Map<Id,Account>([select id,description from account where Id in :Ids]);
        List<Opportunity> ol=new List<Opportunity>();
        for(Opportunity o:  trigger.new){
            if(o.stageName=='Closed Won'){
                
                Account aa=accMap.get(o.AccountId);
                aa.Description='ClosedWon After';
            }
        }
      
        update accMap.values();
    }
    
}