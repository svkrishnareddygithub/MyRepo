public class Shedule_Example implements Schedulable {
    public void execute(SchedulableContext sc){
        List<Opportunity> op=[select id,stageName from Opportunity];
        for(Opportunity o: op){
            o.stageName='Qulification';
        }
        update op;
    }
}