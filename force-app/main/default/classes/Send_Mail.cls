public class Send_Mail {
 //   public Account acc {set;get;}
 //   public List<Contact> contacts {set;get;}
   // public Send_Mail(ApexPages.StandardController controller){
        //acc=(Account)controller.getRecord();
   // }
    public void call(){
        /*List<Contact> contacts=[select id,lastName,email from Contact where AccountId =: acc.Id];
        List<String> emails=new List<String>();
        for(Contact c: contacts){
            if(c.email!=null){
                emails.add(c.Email);
            }
        }
        Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
        msg.setToAddresses(emails);
        msg.setSubject('Update Contact Details');
        msg.setPlainTextBody('you need to update contact');
        List<Messaging.Email> mail=new List<Messaging.Email>{msg};
        //Messaging.sendEmail(mail);
        PageReference p=new PageReference('/'+acc.Id);
        return p;  
        */ 
        
    }
}