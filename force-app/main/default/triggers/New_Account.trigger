trigger New_Account on Account (before insert) {
    List<Account> accList=trigger.new;
    for(Account a: accList ){
        if(a.Rating=='cold'){
            a.Industry='banking';
        }
    }
}