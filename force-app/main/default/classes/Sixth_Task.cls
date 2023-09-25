public class Sixth_Task {
    public Account acc {set;get;}
    public Contact con {set;get;}
    public Opportunity op {set;get;}
    public Account ref   {set;get;}
    public Sixth_Task(){
        acc=new Account();
        con=new Contact();
        op=new Opportunity();
        ref=new Account();
    }
   
    public PageReference nextA(){
        insert acc;
        PageReference p=Page.Sixth_Contact;
       // p.setRedirect(true);
        return p;
    }
    public PageReference nextC(){
        ref=[select id,name from Account Order By createdDate DESC  limit 1];
        con.AccountId=ref.Id;
        insert con;
        PageReference p=Page.Sixth_Opportunity;
     //   p.setRedirect(true);
        return p;
    }
    public pageReference submit(){
        ref=[select id,name from Account Order By createdDate DESC limit 1];
        op.AccountId=ref.id;
        insert op;
        PageReference p=new PageReference('/'+ref.id);
      //  p.setRedirect(true);
        return p;
    }
}