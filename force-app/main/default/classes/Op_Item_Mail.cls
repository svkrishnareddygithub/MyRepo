public class Op_Item_Mail {
    public static void sendEmail(List<OpportunityLineItem> olList){
        List<Account> accList=[select id,Name,Rating,Phone,Industry from Account];
        
        List<Contact> conList=[select Id,lastName,firstName,email from Contact where AccountId IN: accList limit 1];
        
        List<Opportunity>optyList=[select id,name,stageName,closeDate,AccountId from Opportunity where AccountId IN: accList];
        
        olList=[select id,quantity,totalPrice,ProductCode,ListPrice,UnitPrice,OpportunityId from OpportunityLineItem where OpportunityId IN:optyList];
        
        List<String> emails=new List<String>();
        for(Contact c: conList){
            emails.add(c.email);
        }
        for(OpportunityLineItem a: olList){
            Messaging.singleEmailMessage msg=new Messaging.SingleEmailMessage();
            msg.toaddresses=emails;
            String name='Hi'+'Your Order has been procced <br/>'+
                                 'your Order Details is Below <br/>'+
                                  a.ProductCode+'<br/>'+
                                  a.UnitPrice+'<br/>'+
                                   a.ListPrice;
            msg.plaintextbody=name;
            List<Messaging.SingleEmailMessage> sendMsg=new List<Messaging.SingleEmailMessage>{msg};
            Messaging.sendEmail(sendMsg);
        }    
    }
}