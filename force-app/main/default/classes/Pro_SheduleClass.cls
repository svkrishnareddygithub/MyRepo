public class Pro_SheduleClass implements Schedulable {
     public void execute(System.SchedulableContext sc)
     {
         pro_task p=new pro_Task();
         database.executeBatch(p,200);
     }
}