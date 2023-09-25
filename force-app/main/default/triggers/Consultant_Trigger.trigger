trigger Consultant_Trigger on Consultant__c (after insert) {
    if(trigger.isAfter){
       New_Page.afterInsert(trigger.new);
    }
}