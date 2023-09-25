public class New_Task {
    public String lastName {set;get;}
    public String firstName {set;get;}
    public String phone {set;get;}
    public String mobile {set;get;}
    public void create(){
        Contact c=new Contact();
        c.LastName=lastName;
        c.FirstName=firstName;
        c.Phone=phone;
        c.MobilePhone=mobile;
        if(c.Phone==null){
            c.MobilePhone = '' ;
        }else if(c.MobilePhone==null){
            c.Phone='';
        }
        insert c;
    }
}