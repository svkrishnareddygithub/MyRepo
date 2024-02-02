trigger StepTrigger on copado__Step__c (before insert,before update) {
	StepHandler.stepHandlerMethod(trigger.new);
}