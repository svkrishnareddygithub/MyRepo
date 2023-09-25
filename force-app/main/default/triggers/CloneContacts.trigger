trigger CloneContacts on Contact (before update) {
    if(trigger.isUpdate){
        CloneContacts.calling(trigger.oldMap,trigger.newMap);
    }

}