public class Contact_Insert {
    public String lastName    {set;get;}
    public String firstName {set;get;}
    public String phone {set;get;}
    public String email {set;get;}
    public PageReference saveCon(){
        PageReference p;
        List<Contact> contacts=[select id,lastName,firstName from Contact];
        Integer count=contacts.size();
        if(count>31){
         ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.ERROR,'Exceed the Contact Size');
         ApexPages.addMessage(msg);
        }else{
            Contact c=new Contact();
            c.firstName=firstName;
            c.lastName=lastName;
            c.phone=phone;
            c.email=email;
            insert c;
            p=new PageReference('/'+c.Id);
        }
        return p;
        
    }
}