public class UserRecordsOfContacts {
    public static void call()
    {
       List<Contact> conList=[select id,lastName,OwnerId from Contact];
       Map<Id,List<Contact>> userCon=new Map<Id,List<Contact>>();
       set<id> ids=new set<id>();
        
       for(Contact c: conList)
       {
            ids.add(c.ownerId);
       }
       for(Id i: ids)
       {
            List<Contact> con=new List<Contact>();
            for(Contact c: conList)
            {
                if(i==c.OwnerId)
                {
                    con.add(c);
                }
             }
            userCon.put(i,con);  
       }
        System.debug(userCon.get('0055j0000033x56AAA').size());
    }
    /*
     public static void call(){
       List<Contact> conList=[select id,lastName,OwnerId from Contact];
       Map<Id,List<Contact>> userCon=new Map<Id,List<Contact>>();
       set<id> ids=new set<id>();
               
       for(Contact c: conList){
            userCon.put(c.OwnerId, new List<Contact>());
          
       }
        for(Contact ct:conList){
             userCon.get(ct.OwnerId).add(ct);
        }
        System.debug(userCon.get('0055j0000033x56AAA').size());
    }
    */
}