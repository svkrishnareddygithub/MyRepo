trigger Account_Mail on Account (after insert) {
    List<Account> accList=trigger.new;
    List<Contact> conList=[select Id,LastName,FirstName,Email from Contact where AccountId IN: accList];
    List<String> emails=new List<String>();
    for(Contact c: conList){
        emails.add(c.Email);
    }
    for(Account  a: accList){
          Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
          msg.setToAddresses(emails);
          msg.setPlainTextBody('Yoour Account is created');
          msg.setSubject('Hi dear'+a.Name);
          List<Messaging.SingleEmailMessage> msgs=new List<Messaging.SingleEmailMessage>{msg};
          Messaging.sendEmail(msgs);
    }
}