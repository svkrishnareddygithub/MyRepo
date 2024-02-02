public class StepHandler {
    public static void stepHandlerMethod(List<copado__Step__c> steps){
        Map<Id,copado__Quality_Gate__c> gateMap=new Map<Id,copado__Quality_Gate__c>([SELECT Id,Name, copado__Type__c FROM copado__Quality_Gate__c]);
        for(copado__Step__c step: steps){
            if(step.copado__Automated_Behaviour__c!= null){
                copado__Quality_Gate__c gate=gateMap.get(step.copado__Automated_Behaviour__c);
                if(step.Name!=gate.Name){
                    step.Name=gate.Name;
                }
            }
        }
    }
}