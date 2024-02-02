trigger ManualApprovalStepsAutomationTrigger on copado__Deployment__c (after insert,after update) {
    if(trigger.isInsert && trigger.isAfter){
        ManualApprovalStepsAutomation.SourceFieldUpdate(trigger.new);
    }
    
    ManualApprovalStepsAutomation.callMe(Trigger.new, Trigger.oldMap);
}