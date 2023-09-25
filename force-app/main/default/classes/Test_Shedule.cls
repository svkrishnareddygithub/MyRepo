@isTest
public class Test_Shedule {
@isTest
    public static void call(){
        Test_Opty.main();
        Test.StartTest();
          Shedule_Example e=new Shedule_Example();
           String c='0 0 10 10 5 ?';
           id jobId=System.Schedule('abc',c,e);
        Test.StopTest();
        Opportunity op=[select id,name from Opportunity];
        System.assertEquals('Qualification' , op.StageName);
        CronTrigger con=[select id,cronExpression from CronTrigger where id=:jobId];
        System.assertEquals(c,con.id);
    }
}