trigger SendMailToMngrEmail on User (after update) {
    public Id mngId;
    public Id uId;
    for(user u: trigger.new){
        if(u.ManagerId!=null){
            mngId=u.ManagerId;
            uId=u.Id;
        }
    }
    User um=[select id,email from User where Id=:mngId];
    List<String> s=new List<String>();
     s.add(um.email);
    List<Account> accList=[select id,name,(select id,lastName from Contacts) from Account where ownerId=:uId];
    integer accCount=accList.size();
    Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
        msg.setToAddresses(s);
        msg.setSubject('Your Accounts and Number of Related Contacts');
        String body='Dear User,<br/>';
        body+='You have assigned number of account and Account Contains Number of Contacts.<br/>';
        body+='Total Accounts:' +accCount+ '<br/>';
    for(Account a: accList){
        body+=a.Name+'='+a.contacts.size()+'br/>';
    }
    msg.setHtmlBody(body);
    List<Messaging.SingleEmailMessage> mails=new List<Messaging.SingleEmailMessage>{msg};
        Messaging.sendEmail(mails);
}