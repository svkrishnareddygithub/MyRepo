trigger ManualApprovalStepsAutomationTrigger on copado__Deployment__c (after insert,after update,before update) {
   /* if(trigger.isInsert && trigger.isAfter){
        ManualApprovalStepsAutomation.SourceFieldUpdate(trigger.new);
    }else*/ 
    if(trigger.isUpdate && trigger.isAfter){
      ManualApprovalStepsAutomation.stepsToBeAutomate(Trigger.new, Trigger.oldMap);
    }
}