trigger Duplicate_Record_Opp on Opportunity (before insert) {
        for(Opportunity o: trigger.new){
        integer count=[select count() from Opportunity where stageName=:o.StageName];
        if(count<0){
            Opportunity oppp=new Opportunity();
            oppp.Name=o.Name;
            oppp.StageName=o.StageName;
            oppp.CloseDate=o.CloseDate;
            insert oppp;
        }
    }
}