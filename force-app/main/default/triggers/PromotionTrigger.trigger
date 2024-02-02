	trigger PromotionTrigger on copado__Promotion__c (after insert,after update) {
		PromotionTriggerHandler.callMe(trigger.new, trigger.oldMap);
	}