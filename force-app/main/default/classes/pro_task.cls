public class pro_task implements Database.Batchable<sObject>,Database.Stateful
{
    
    MAp<Id,Contact> newcontid = new Map<Id,Contact>();
    public pro_task(List<contact>conList)
    {
       for(Contact c: conList)
       {
           if(c.email!=null)
           {
               newcontid.put(c.Id,c);
           }
       }
    }
    Public Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator([select id,LastName,Email From Contact where id in:newcontid.keySet()]);
    }
    public void execute(Database.BatchableContext bc , List<Contact>gainconval)
    {
        for(contact con : gainconval)
        {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new String[] {con.email});
            email.setSubject('Wellcome Mail');
            email.setPlainTextBody('Wellcome Your Contact is Created Successfully in salesforce');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
        }
    }
    public void finish(database.BatchableContext bc)
    {
        
    }
}
    
    /*
    List<String> toAddresses=new List<String>();
    
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        String oppList='select id,closeDate,owner.email,stageName from Opportunity';
        return database.getQueryLocator(oppList);
    }
    public void execute(database.BatchableContext bc, List<Opportunity> opps)
    {
        List<Opportunity> updateOpps=new List<Opportunity>();
        for(Opportunity o: opps)
        {
            if(o.closeDate==System.today())
            {
                o.stageName='Closed Lost';
                toAddresses.add(o.Owner.Email); 
                updateOpps.add(o);
            }
        }
        update updateOpps;
    }
    public void finish(database.BatchableContext bc)
    {
        
         Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
         msg.setToAddresses(toAddresses);
		 msg.setSubject('Opportunity has been closed');
         msg.setPlainTextBody('The opportunity has been closed as Lost');
         Messaging.sendEmail(new Messaging.singleEmailMessage[]{msg});
		
    }
*/