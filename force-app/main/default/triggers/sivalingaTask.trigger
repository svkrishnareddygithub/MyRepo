trigger sivalingaTask on Account (after insert, after update) {
   Map<Id,Account> accMap=new Map<Id,Account>([select id,name,Industry,(select id,lastName,email,AccountId from Contacts) from Account where id in: trigger.new]);
    List<Contact> conlist=new List<Contact>();
    for(Account a: trigger.new){
        if(a.Industry=='Banking')
            conlist=accMap.get(a.Id).contacts;
	}
    List<Contact> newConList=new List<Contact>();
    for(Contact c: conlist){
        Account acc=accMap.get(c.AccountId);
        c.LastName=acc.Name;
        c.Email='sivalinga@gmail.com';
        newConLIst.add(c);
    }
    update newConList;  
}

/*
     // Create a list to hold the updated contacts

    List<contact> conlst = new List<contact>();

    if(Trigger.isAfter && Trigger.isUpdate)
    {
            // Iterate over the updated accounts
     List<Account> accList=[select id,name,industry from Account where id in: trigger.new];
       for(Account acc : accList)
       {
                // Check if the account's industry has been changed to "banking"

           if(acc.Industry =='Banking')
           {
                // Retrieve the related contacts for the account

               List<contact> contas = [select id,LastName,Email from contact where AccountId =:acc.Id];
            // Iterate over the contacts and update the last name

               for(contact con : contas)
               {
               con.LastName = acc.Name;
               con.Email='sivalinga@gmail.com';
               //con.AccountId = acc.Id;
               conlst.add(con);
               }
           }  
       }
        update conlst;
        
    }
*/