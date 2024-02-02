public class ManualApprovalStepsAutomation {
    
    
    public static void SourceFieldUpdate(List<copado__Deployment__c> deployments){
        
        List<copado__Deployment__c> deploymentListFilter = [SELECT Id, copado__From_Org__c,Is_Submitted_For_Approval__c,copado__Completed__c, copado__Promotion__c,copado__Promotion__r.Approval_Status__c, copado__From_Org__r.Name,Promotion_Approval_Status__c,
                                                            copado__Status__c, (SELECT Id,Name, copado__status__c FROM copado__steps__r) 
                                                            FROM copado__Deployment__c WHERE Id IN :deployments];
	
        List<copado__Promotion__c> promUpdateSource =new List<copado__Promotion__c>();
        for (copado__Deployment__c c : deploymentListFilter) {
            
                copado__Promotion__c prom =new copado__Promotion__c();
                prom.Id=c.copado__Promotion__c;
                if(prom.Source_Custom_Field__c!=c.copado__From_Org__r.Name){
                    prom.Source_Custom_Field__c=c.copado__From_Org__r.Name;
                    promUpdateSource.add(prom);
                }
        }
        if (!promUpdateSource.isEmpty()) {
            update promUpdateSource;
        }
    }
    
    

    public static void callMe(List<copado__Deployment__c> deployments  , Map<Id, copado__Deployment__c> oldMap) {
        
        Set<Id> promotionIds = new Set<Id>();
        for (copado__Deployment__c deployment : deployments) {
            promotionIds.add(deployment.copado__Promotion__c);
        }
        
        Map<Id, copado__Promotion__c> promList = new Map<Id, copado__Promotion__c>([SELECT Id, Name, copado__Destination_Org_Credential__r.Name, 
                                                                                    copado__Destination_Environment__r.Name, copado__Source_Environment__r.Name,
                                                                                    copado__Source_Org_Credential__r.Name, copado__Status__c, Source_Custom_Field__c,Approval_Status__c FROM copado__Promotion__c where Id IN :promotionIds]);

		Set<Id> approvalSteps=new Set<Id>();
        List<copado__Deployment__c> deploymentListFilter = [SELECT Id, copado__From_Org__c,Is_Submitted_For_Approval__c,copado__Completed__c, copado__Promotion__c,copado__Promotion__r.Approval_Status__c, copado__From_Org__r.Name,Promotion_Approval_Status__c,
                                                            copado__Status__c, (SELECT Id,Name, copado__status__c FROM copado__steps__r) 
                                                            FROM copado__Deployment__c WHERE Id IN :deployments];
        
		copado__Promotion__c promotinrec =new copado__Promotion__c();
        
        if(!deploymentListFilter.isEmpty()){
        for (copado__Deployment__c c : deploymentListFilter) {
            promotinrec = promList.get(c.copado__Promotion__c);
            if (c.copado__Status__c == 'In Progress') {
                for(copado__step__c step : c.copado__steps__r) {
                    if (step.Name != null && (step.Name.contains('QA Approval') || step.Name.contains('UAT Approval')) && step.copado__status__c=='In Progress'){ 
                        
                        copado__Deployment__c oldDep=new copado__Deployment__c();
                        if(!oldMap.isEmpty()){	
                          oldDep=oldMap.get(c.Id);
                        }
                        
                        if(!isRecordAlreadySubmittedForApproval(c.Id)){
                            markRecordAsSubmittedForApproval(c.Id);
                            Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
                            req.setComments('Submitting record for approval via Apex');
                            req.setObjectId(promotinrec.Id);
                            Approval.ProcessResult result = Approval.process(req);
                        }
                        else if((oldDep.Promotion_Approval_Status__c=='UAT Approved' || oldDep.Promotion_Approval_Status__c=='UAT Rejected') && (c.Promotion_Approval_Status__c=='Approved' || c.Promotion_Approval_Status__c=='Rejected')){
                            approvalSteps.add(step.Id);
                        }else if((oldDep.Promotion_Approval_Status__c=='QA Approved' || oldDep.Promotion_Approval_Status__c=='QA Rejected') && (c.Promotion_Approval_Status__c=='Approved' || c.Promotion_Approval_Status__c=='Rejected')){
                            approvalSteps.add(step.Id);
                        }
                    } 
        		}
            }else if(c.copado__Status__c == 'Cancelled'){
                c.Is_Submitted_For_Approval__c=false;
                c.Promotion_Approval_Status__c='';
            }
         }
        }
        
        
        List<copado__step__c> filterSteps = [SELECT Id, Name, copado__status__c,copado__Deployment__c, copado__Deployment__r.copado__Promotion__c,copado__Deployment__r.Promotion_Approval_Status__c,
                                            copado__Deployment__r.Is_Submitted_For_Approval__c, (SELECT Id, copado__Status__c FROM copado__Deployment_Jobs__r) 
                                             FROM copado__step__c where Id IN: approvalSteps];
        List<copado__Deployment_Job__c> jobs=new List<copado__Deployment_Job__c>();
        
        List<copado__Deployment__c> updateDeployments=new List<copado__Deployment__c>();
        copado__Deployment__c stepstobeCancel=new copado__Deployment__c();
            
        for(copado__step__c c: filterSteps){
                if(c.copado__Deployment__r.Promotion_Approval_Status__c=='Approved'){
                    for (copado__Deployment_Job__c j : c.copado__Deployment_Jobs__r) {
                        j.copado__Status__c = 'Success';
                        jobs.add(j);
                    }
                     c.copado__Deployment__r.Is_Submitted_For_Approval__c=false;
                     c.copado__Deployment__r.Promotion_Approval_Status__c='';
                     updateDeployments.add(c.copado__Deployment__r);
                }else if(c.copado__Deployment__r.Promotion_Approval_Status__c=='Rejected'){
                    for (copado__Deployment_Job__c j : c.copado__Deployment_Jobs__r) {
                        j.copado__Status__c = 'Failed';
                        jobs.add(j);
                    }
                    c.copado__Deployment__r.Is_Submitted_For_Approval__c=false;
                    c.copado__Deployment__r.Promotion_Approval_Status__c='';
                    c.copado__Deployment__r.copado__Status__c='Rejected';
                    updateDeployments.add(c.copado__Deployment__r);
                    stepstobeCancel.Id=c.copado__Deployment__c;
                }
        }
        
        
        if(stepstobeCancel!=null){
            List<copado__step__c> stepsTobeCancelQuery = [SELECT Id, Name, copado__status__c,copado__Deployment__c, copado__Deployment__r.copado__Promotion__c,copado__Deployment__r.Promotion_Approval_Status__c,
                                            copado__Deployment__r.Is_Submitted_For_Approval__c, (SELECT Id, copado__Status__c FROM copado__Deployment_Jobs__r) 
                                             FROM copado__step__c where copado__Deployment__c =: stepstobeCancel.Id];
            for(copado__step__c c: stepsTobeCancelQuery){
                if(c.copado__Status__c=='Not started'){
                    for (copado__Deployment_Job__c j : c.copado__Deployment_Jobs__r) {
                        j.copado__Status__c = 'Cancelled';
                        jobs.add(j);
                    }	
                }
            }
        }
        if(!jobs.isEmpty()){
       	 	update jobs;
        }
        if(!updateDeployments.isEmpty()){
        	update updateDeployments;
        }
        
    }
    
    // Helper method to check if the record is already submitted for approval
    private static Boolean isRecordAlreadySubmittedForApproval(Id deploymentId) {
        copado__Deployment__c deployment = [SELECT Is_Submitted_For_Approval__c FROM copado__Deployment__c WHERE Id = :deploymentId LIMIT 1];
        return deployment != null && deployment.Is_Submitted_For_Approval__c;
    }

    // Helper method to mark the record as submitted for approval
    private static void markRecordAsSubmittedForApproval(Id deploymentId) {
        copado__Deployment__c deploymentToUpdate = new copado__Deployment__c(Id = deploymentId, Is_Submitted_For_Approval__c = true);
        update deploymentToUpdate;
    }
}