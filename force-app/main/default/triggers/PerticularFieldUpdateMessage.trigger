trigger PerticularFieldUpdateMessage on Lead (after update) {
  integer k=0;
    For(Lead land:Trigger.new){
         string sub='';
         Lead NewLead = land;
         System.debug('New Lead    '+NewLead+'     newLead');
         Lead OldLead = trigger.old[k];
         Lead LeadObject = new Lead(); // This takes all available fields from the required object.
        //Schema.SObjectType objType = LeadObject.getSObjectType();
        Map<String, Schema.SObjectField> M = Schema.SObjectType.Lead.fields.getMap();
        //System.debug(Schema.SObjectType.Lead.fields+'              map    '+Schema.SObjectType);
        for (String str : M.keyset()){
                 try{
                   //System.debug('Field name: '+str +'. New value: ' + NewLead.get(str) +'. Old value: '+OldLead.get(str));
                   if(NewLead.get(str) != OldLead.get(str)){
                        //system.debug('******The value has changed!!!! '+NewLead.get(str)); // here goes more code
                        if(str!='lastmodifieddate' && str!='systemmodstamp'){
                            sub =sub+','+ M.get(str);
                            System.debug('sub   '+ sub+'    NewLead.get(str)  '+NewLead.get(str));
                         }
                    }
                }
                catch (Exception e) {
                    System.debug('Error: ' + e);
                }
            }
   
   
           /* list<messaging.SingleEmailMessage> emails= new list<messaging.SingleEmailMessage>();
            messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
            string[]toadd=new string[]{NewLead.email};
            msg.setToAddresses(toadd);
            msg.setSubject('Details stored in Data Base');
            string body= 'These fields were changed '+sub;
            system.debug(sub);
            //body= body+ '<br/> Your Phone No is'+s.Mobile_Number__c;
            msg.setHtmlBody(body);
            emails.add(msg);
            messaging.sendEmail(emails); */
            K++;
    }
}