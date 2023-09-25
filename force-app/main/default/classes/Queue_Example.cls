public class Queue_Example implements Queueable {
    public void execute(QueueableContext qc){
        List<Opportunity> op=[select id,stageName,closeDate from Opportunity where  stageName='closed won'];
        List<Opportunity> li=new List<Opportunity>();
            for(Opportunity o: op){
                o.stageName='prospecting';
                o.closeDate=System.today();
                li.add(o);
            }
        update li;
        Opporunity_Batch ob=new Opporunity_Batch();
        database.executeBatch(ob);
    }
}