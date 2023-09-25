trigger Opty_Line_Item on Opportunity (after insert) {
       List<Opportunity> opty=Trigger.new;
    if(Trigger.isinsert){        
        for(Opportunity o: opty){
            OpportunityLineItem ol=new OpportunityLineItem();
            ol.PricebookEntryId='01u5j000002d6NN';
            ol.OpportunityId=o.id;
            ol.Quantity=2;
            ol.TotalPrice=20000;
            insert ol;
        }
    }
}