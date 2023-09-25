public class InboundEmail implements Messaging.InboundEmailHandler{
    public Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope env){
        Contact con=[select id,lastName,email from Contact where email =: email.fromAddress limit 1];
        Messaging.InboundEmailResult res=new Messaging.InboundEmailResult();
        try{
            Case c=new Case();
            c.ContactId=con.Id;
            c.Status='new';
            c.Origin='email';
            c.Subject=email.subject;
            c.Description=email.plainTextBody;
            insert c;
            
        }catch(Exception e){
            e.getCause();
        }
        return res;
    }
}