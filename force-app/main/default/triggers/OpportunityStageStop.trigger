trigger OpportunityStageStop on Opportunity (before Update) {
        for(Opportunity o: trigger.new){
            Opportunity op=trigger.oldMap.get(o.Id);
            if(o.StageName!='Closed Lost'){
                if(o.Probability<op.Probability){
                    o.addError('Stage Could not be decreased');
                }
         }
    }
}