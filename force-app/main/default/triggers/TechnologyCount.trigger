trigger TechnologyCount on OppServices__c (before insert,before Update) {
     if(trigger.isInsert){
            Technology_Count.call(trigger.new);
       }else if(trigger.isUpdate){
            Technology_Count.callMe(trigger.oldMap,trigger.newMap);
      }
}