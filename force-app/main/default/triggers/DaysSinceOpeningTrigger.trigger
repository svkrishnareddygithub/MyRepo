trigger DaysSinceOpeningTrigger on Retail_Store__c (before insert,before update) {
    if(trigger.isBefore && (trigger.isInsert  || trigger.isUpdate)){
        DaysSinceOpening.insertorUpdate(trigger.new); //calling the apex handler and passing the list of records
    }
}