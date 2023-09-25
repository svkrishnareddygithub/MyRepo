public class DeployRetrieveClass {
    public static void call(){
        List<Sample_Object__c> li=[select id,Name,Status__c from Sample_Object__c];
    }
}