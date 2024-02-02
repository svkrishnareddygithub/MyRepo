public with sharing class ApprovalTrackingHistory {
    @AuraEnabled(cacheable=true)
    public static List<copado__Promotion__c> PromotionRecords(String userStoryId){
        List<copado__Promotion__c> promotions=[SELECT Id, Name FROM copado__Promotion__c WHERE Id IN (SELECT copado__Promotion__c FROM copado__Promoted_User_Story__c 
                                                  WHERE copado__User_Story__c =:userStoryId)];

        return promotions;
    }


    @AuraEnabled(cacheable=true)
    public static List<ApprovalHistoryWrapper> getPromotionApprovalHistory(Id promotionId) {
        List<ProcessInstance> processInstances = [SELECT Id, TargetObjectId, Status, CreatedDate, CompletedDate,
                            (SELECT ProcessNode.Name, StepStatus, Comments, CreatedDate, Actor.Name FROM StepsAndWorkitems ORDER BY CreatedDate DESC)
                            FROM ProcessInstance
                            WHERE TargetObjectId = :promotionId
                            ORDER BY CreatedDate DESC
                            ];

    
        List<ApprovalHistoryWrapper> approvalHistoryList = new List<ApprovalHistoryWrapper>();

        if (!processInstances.isEmpty()) {
            for (ProcessInstance insta : processInstances) {
                for (ProcessInstanceHistory step : insta.StepsAndWorkitems) {
                    ApprovalHistoryWrapper history = new ApprovalHistoryWrapper();
                    history.Name = step.ProcessNode.Name;
                    history.StepStatus = step.StepStatus;
                    history.Comments = step.Comments;
                    history.CreatedDate = step.CreatedDate;
                    history.Actor = step.Actor.Name;
                    // Set the Actors field for each individual ApprovalHistoryWrapper
                    history.Actors.add(step.Actor.Name);
                    approvalHistoryList.add(history);
                }
            }
        }
        for(ApprovalHistoryWrapper  a:approvalHistoryList){
            System.debug(a.Actors);
        }

        return approvalHistoryList;
    }

    public class ApprovalHistoryWrapper {
        @AuraEnabled public String Name;
        @AuraEnabled public String StepStatus;
        @AuraEnabled public String Comments;
        @AuraEnabled public Datetime CreatedDate;
        @AuraEnabled public String Actor;
        @AuraEnabled public List<String> Actors;
        
        public ApprovalHistoryWrapper() {
            Actors = new List<String>();
        }
    }
}