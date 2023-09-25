trigger TotalOppAmount on Opportunity (after insert,after delete,after update,before delete) {
    if(trigger.isinsert && trigger.isAfter){
        AccouuntShare.insertOpp(trigger.new);
    }
    else if(trigger.isdelete && trigger.isAfter){
        AccouuntShare.insertOpp(trigger.old);
    }
    else if(trigger.isUpdate){ 
        AccouuntShare.insertOpp(trigger.old);
    }
}