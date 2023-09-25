global class Opporunity_Batch implements database.Batchable<sobject> {
    public List<Opportunity> ol;
    public Opporunity_Batch(){
        ol=new List<Opportunity>();
    }
    global database.QueryLocator start(database.BatchableContext bc){
        String query='select id,name,stageName,Amount,closeDate from Opportunity';
        return database.getQueryLocator(query);
    }
    global void execute(database.BatchableContext bc,List<Opportunity> scope){
        for(Opportunity o: scope){
            if(o.StageName=='closed won'){ 
                o.Amount=o.Amount*.30;
               
            }
        }update scope;
    }
    global void finish(database.batchablecontext bc){
         String mailId=Userinfo.getUserEmail();
        AsyncApexJob crone=[SELECT Id, JobType, Status, TotalJobItems, 
                            CreatedBy.email, JobItemsProcessed, NumberOfErrors, 
                            CronTriggerId FROM AsyncApexJob where id=:bc.getJobId() ];
        Messaging.singleEmailMessage msg=new Messaging.SingleEmailMessage();
        String[] toAdd=new string[]{crone.CreatedBy.email};
        msg.setToAddresses(toAdd);
        String[] tocc=new String[]{'venkysmily433@gmail.com'};
        msg.setCcaddresses(tocc);
        msg.setSubject('Batch Job:'+bc.getJobId());
        msg.setPlainTextBody('Batch job Completed');
        msg.setSenderDisplayName('System Admin');
        List<Messaging.singleEmailMessage>emails=new List<Messaging.singleEmailMessage>{msg};
            messaging.sendEmail(emails);
    }
}