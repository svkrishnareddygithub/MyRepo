public class New_Obj {
    public Wrapper_Class1 wr {set;get;}
    
    public New_Obj(){
      wr =new Wrapper_Class1();
    }
    public PageReference create(){
        PageReference p;
        Account acc=new Account();
        acc.name=wr.name;
        acc.rating=wr.rating;
        acc.phone=wr.phone;
        acc.industry=wr.industry;
        insert acc;
        p=new PageReference(+acc.Id);
        return p;
    }
}