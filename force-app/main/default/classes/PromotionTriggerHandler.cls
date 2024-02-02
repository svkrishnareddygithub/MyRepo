public class PromotionTriggerHandler {
    
    private static Boolean isExecuting = false;
    
    public static void callMe(List<copado__Promotion__c> promotionList, map<id,copado__Promotion__c> oldProm) {
        if (!isExecuting) {
            isExecuting = true;
		try {
            Set<Id> promotionIds = new Set<Id>();
    
            for (copado__Promotion__c p : promotionList) {
                promotionIds.add(p.Id);
            }
    
            List<copado__Promotion__c> promList = [
                SELECT Id, Name, User_Stories__c, Approval_Status__c, Source_Custom_Field__c,copado__Status__c,
                    (SELECT Id,copado__Status__c, copado__From_Org__r.Name, Promotion_Approval_Status__c FROM copado__Deployments__r)
                FROM copado__Promotion__c WHERE Id IN :promotionIds
            ];
            // Query Promoted_User_Stories__c outside the loop
                Map<Id, List<copado__Promoted_User_Story__c>> usMap = new Map<Id, List<copado__Promoted_User_Story__c>>();
                for (copado__Promoted_User_Story__c userStory : [
                    SELECT Id, copado__User_Story__r.Name, copado__Promotion__c
                    FROM copado__Promoted_User_Story__c
                    WHERE copado__Promotion__c IN :promotionIds
                ]) {
                    if (!usMap.containsKey(userStory.copado__Promotion__c)) {
                        usMap.put(userStory.copado__Promotion__c, new List<copado__Promoted_User_Story__c>());
                    }
                    usMap.get(userStory.copado__Promotion__c).add(userStory);
                }
           
    
            List<copado__Deployment__c> depUpdate = new List<copado__Deployment__c>();
    		List<copado__Promotion__c> updateProm = new List<copado__Promotion__c>();
            
            for (copado__Promotion__c p : promList) {
                if (p.Approval_Status__c != null) {
                    if (p.copado__Deployments__r != null) {
                        for (copado__Deployment__c d : p.copado__Deployments__r) {
                            if (p.Approval_Status__c != d.Promotion_Approval_Status__c) {
                                d.Promotion_Approval_Status__c = p.Approval_Status__c;
                                depUpdate.add(d);
                            }
                        }
                    }
                }
                if(p.copado__Status__c=='In Progress'){
                    if(oldProm.get(p.Id).Approval_Status__c=='Pending' &&  p.Approval_Status__c=='Rejected'){
                        p.copado__Status__c='Rejected';
                        //updateProm.add(p);
                    }
                }
                p.User_Stories__c = '';
                    if (usMap.containsKey(p.Id)) {
                        for (copado__Promoted_User_Story__c u : usMap.get(p.Id)) {
                            p.User_Stories__c += u.copado__User_Story__r.Name + ', ';
                        }
                    }
                    if (!String.isEmpty(p.User_Stories__c)) {
    					p.User_Stories__c = p.User_Stories__c.removeEnd(', ');
					}
                    updateProm.add(p);
            }
    
            if (!depUpdate.isEmpty()) {
                update depUpdate;
            }
            if (!updateProm.isEmpty()) {
                 update updateProm;
               }
        }finally {
           isExecuting = false;
        }
     }
   }
}