public class Duplicate_Contacts {
    
   public static void duplicate(List<Contact> conList){
      String s;
       List<Contact> li=[select id,lastName,firstName,email,phone from Contact where  title=:s];
        for(Contact c: conList){
            s=c.Title;
            if(li.size()<0){
                Contact co=new Contact();
                co.LastName=c.LastName;
                co.FirstName=c.FirstName;
                co.Email=c.Email;
                co.Phone=c.Phone;
                insert co;
            }
            else{
                ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.ERROR,'Duplicate Record Found');
                ApexPages.addMessage(msg);
            }
        }
    }

}