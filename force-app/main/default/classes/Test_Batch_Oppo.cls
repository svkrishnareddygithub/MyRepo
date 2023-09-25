@isTest
public class Test_Batch_Oppo {
   @isTest
    static void create(){
        Test_Batch_Oppo.invoke();
        Test.startTest();
         Opporunity_Batch be=new Opporunity_Batch();
        Id jobId=database.executeBatch(be,5);
        Test.stopTest();
        Opportunity opty=[select id,name,stageName,closedate from Opportunity];
        System.assertEquals('closed Won', opty.StageName);
        System.assertEquals(System.today(),opty.closeDate);

    }
    public static void invoke(){
        Opportunity op=new Opportunity();
        op.name='krishna';
        op.StageName='prospecting';
        op.CloseDate=System.today()+11;
        insert op;
    }
}