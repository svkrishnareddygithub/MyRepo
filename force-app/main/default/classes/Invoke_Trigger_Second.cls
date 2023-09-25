public class Invoke_Trigger_Second {
  /*  public static void call(Map<id,Account> oldMap,Map<Id,Account> newMap){
        Map<Id,List<Contact>> mapAcc=new Map<Id,List<Contact>>();
        for(Contact c: [select id,lastName,AccountId from Contact]){
            mapAcc.put(c.AccountId,new List<Contact>());
            mapAcc.get(c.AccountId).add(c);
        }
        set<Id> ids =oldMap.keySet();
        List<Contact> conList=new List<Contact>();
        for(ID s: ids){
            Account oldOne=oldMap.get(s);
            Account newOne=newMap.get(s);
            if(oldOne.Name!=newOne.name){
                List<Contact> con=mapAcc.get(s);
                if(con.size()>0){
                    for(Contact c: con){
                        conList.add(c);
                    }
                }
            } 
        }
        delete conList;
    }
*/
}