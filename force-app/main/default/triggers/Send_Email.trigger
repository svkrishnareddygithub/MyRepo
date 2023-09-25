trigger Send_Email on Contact (after insert) {
      public List<Contact> conList=trigger.new;
    for(Contact c: conList){
        Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
        String[] toAdd=new String[] {c.Email};
        msg.toaddresses=toAdd;
        msg.plaintextbody='This is a new message';
        List<Messaging.SingleEmailMessage> msgs=new List<Messaging.SingleEmailMessage>{msg};
        Messaging.sendEmail(msgs);
    }
}