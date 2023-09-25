trigger Trigger_First on Account (before update) {
    for(Account a: trigger.new){
        a.Email__c='krishnareddy@gmail.com';
    }
}