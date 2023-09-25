trigger OptLine_Mail on OpportunityLineItem (after insert) {
    if(trigger.isAfter){
        Op_Item_Mail.sendEmail(trigger.new);
    }
}