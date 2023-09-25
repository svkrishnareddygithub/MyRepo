public class Email_Serviece_1 {
    public void call(){
        Messaging.EmailFileAttachment msg=new Messaging.EmailFileAttachment();
        PageReference p=Page.New_Acc_DataTable;
        blob b=p.getContentAsPDF();
        msg.setFileName('Account.pdf');
        msg.setBody(b);
        List<Messaging.EmailFileAttachment> ef=	new List<Messaging.EmailFileAttachment>{msg};
            
        Messaging.SingleEmailMessage msg1=new Messaging.SingleEmailMessage();
        String[] s=new String[]{'krish.reddy809@gmail.com'};
        msg1.setToAddresses(s);
        msg1.setPlainTextBody('Account List');
        msg1.setFileAttachments(ef);
        List<Messaging.Email> e=new List<Messaging.Email>{msg1};
        Messaging.sendEmail(e);
    }
}