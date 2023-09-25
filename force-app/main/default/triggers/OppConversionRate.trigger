trigger OppConversionRate on Opportunity_Track__c (before insert,before Update) {
    /*
        for(Opportunity_Track__c op: trigger.new){
            if(op.Currency_Type__c=='INR'){
                op.Estimated_Value__c=75;
            }else if(op.Currency_Type__c=='JPY'){
                op.Estimated_Value__c=115.04;
            }else if(op.Currency_Type__c=='SGD'){
                op.Estimated_Value__c=1.34;
            }
              op.Robotic__c=false;
                op.Security__c=false;
                op.Operation_Management__c=false;
                op.OPP_D241__c=false;
                op.IT_Cloud_Managed_Services__c=false;
                op.IT_OT_Integration__c=false;
                op.IIoT__c=false;
                op.Others__c=false;
                op.Decd24_Opp__c=false;
       
            if(op.App__c=='Java'){
            /*    op.Robotic__c=true;
                op.Security__c=true;
                op.Operation_Management__c=true;
                op.OPP_D241__c=true;

            }
            else if(op.App__c=='Oracle'){
                op.IT_Cloud_Managed_Services__c=true;
                op.IT_OT_Integration__c=true;
                op.Robotic__c=true;
                op.Security__c=true;
            }else if(op.App__c=='Selenium'){
                op.IT_Cloud_Managed_Services__c=true;
                op.IT_OT_Integration__c=true;
            }else if(op.App__c=='Asset Health Insight'){
                op.IIoT__c=true;
                op.Operation_Management__c=true;
            }else if(op.App__c=='Appium'){
                op.IIoT__c=true;
                op.IT_Cloud_Managed_Services__c=true;
                op.IT_OT_Integration__c=true;
                op.Robotic__c=true;
                op.Security__c=true;
            }
        }
    */
}