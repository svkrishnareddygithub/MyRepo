trigger Account_Update on Account (after update) {
   List<Contact> conList=[select id,lastName,Email,AccountId,Contact.account.email__c,contact.account.phone from Contact where AccountId=:trigger.new];
    if(conList.size()>0){
        List<Contact> conn=new List<Contact>();
        for(Contact cn: conList){
        //    Contact c=new Contact();
            cn.phone=cn.account.phone;
            cn.Email=cn.account.email__c;
            cn.id=cn.id;
            conn.add(cn);
        }
        update conn;
    }
}