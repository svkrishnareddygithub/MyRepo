public class Wrapper_Class {
    public String name              {set;get;}
    public String rating             {set;get;}
    public String industry            {set;get;}
    public String phone               {set;get;}
    public String type                {set;get;}
    public String active               {set;get;}
    public List<Account> accounts    {set;get;}
    public Wrapper_Class(){
        accounts=new List<Account>();
        
    }
    public void addMe(){
        Account acc=new Account();
        acc.name=name;
        acc.rating=rating;
        acc.industry=industry;
        acc.phone=phone;
        acc.type=type;
        acc.Active__c=active;
        accounts.add(acc);     
    }
    public void reset(){
        name=null;
       rating=null;
      industry=null;
        phone=null;
       type=null;
       Active=null;
    }
}