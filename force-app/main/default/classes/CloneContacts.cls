public class CloneContacts {
  public static void calling(Map<Id,Contact> conOld,Map<Id,Contact>conNew){
      List<Contact> conList=new List<Contact>();
       Set<Id>ids=conOld.keySet();
        for(Id i:ids){
            Contact old=conOld.get(i);
            Contact newOne=conNew.get(i);
            if(old.LastName!=newOne.LastName || old.FirstName==newOne.FirstName || old.Email != newOne.Email){
                Contact c=old.clone(false,true,false,false);
                conList.add(c);
            }
        }
      if(conList.size()>0){
       insert conList;
      }
    }
}