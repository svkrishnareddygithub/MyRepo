public class Invoke_BatchApex implements schedulable {
    public void execute(System.schedulableContext sc){
        BatchApex_AccUpdate ba=new BatchApex_AccUpdate();
        Id jobId=database.executeBatch(ba);
    }
}