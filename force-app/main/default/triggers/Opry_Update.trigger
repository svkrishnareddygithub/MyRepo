trigger Opry_Update on Account (after update) {
    if(trigger.isAfter){
            Acc_Opp_Update.updateOpty(trigger.new);
    }
}