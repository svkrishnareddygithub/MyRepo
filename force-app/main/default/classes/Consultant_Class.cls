public class Consultant_Class {
    public static void afterInsert(List<Consultant__c> con){
        List<String> li=new List<String>();
        for(Consultant__c c: con){
           li.add(c.Pan_Number__c);
        }
        integer count=[select count() from Consultant__c where Pan_Number__c IN : li];
        if(count>0){
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.ERROR,'Duplicates Not Allowed');
            ApexPages.addMessage(msg);
        }else{
            insert con;
        }
    }
}