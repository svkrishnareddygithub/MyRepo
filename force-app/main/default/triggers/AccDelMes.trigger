Trigger AccDelMes on Account (after undelete){
   for(Account a: trigger.new){ 
       Messaging.singleEmailMessage msg =new Messaging.singleEmailMessage();
       List<String> s=new List<String>();
       String email=UserInfo.getUserEmail();
       s.add(email);
       msg.setToAddresses(s);
       msg.setSubject('Account undo status');
       msg.setPlainTextBody('AccountName with' +a.name+ 'has retrived from recyclebin');
       List<Messaging.email> e=new List<Messaging.email>{msg};  
       Messaging.sendEmail(e);
   }
}