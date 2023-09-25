global class New_Batch_Apex implements database.Batchable<sObject>{
    global database.QueryLocator start(database.BatchableContext bc){
        String na='krishna';
        String query='select id,name,rating,industry,phone from Account where name=:na';
        return database.getQueryLocator(query);
    }
    global void execute(database.BatchableContext bcas,List<Account> acc){
        List<Account> accList=new List<Account>();
        for(Account a: acc){
            a.rating='warm';
            a.phone='342934349349';
            a.industry='energy';
            accList.add(a);
        }
        update accList;
    }
    global void finish(database.BatchableContext bs){
        List<Account> accList=[select id,name,rating,phone,industry from Account where name='krishna'];
        List<Contact> con=[select id,lastName,firstName,email from Contact where AccountId IN: accList];
        List<String> emails=new List<String>();
        for(Contact c: con){
            emails.add(c.email);
        }
        Messaging.SingleEmailMessage[] msgs=new Messaging.SingleEmailMessage[]{};
        for(Account a: accList){
          Messaging.singleEmailMessage msg=new Messaging.singleEmailMessage();
          msg.setToAddresses(emails);
          String body='hai';
          body+=a.Name +'<br/>';
          body+='Your Phone Number is';
          body+=a.Phone +'<br/>';     
          body+='your Rating is';
          body+=a.Rating +'<br/>';
          msg.setPlainTextBody(body);
          msg.setSubject('please check it once');
          msgs.add(msg);
        }
        Messaging.sendEmail(msgs);
    }
}