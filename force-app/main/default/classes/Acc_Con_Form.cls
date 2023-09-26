public class Acc_Con_Form {
    public String accName      {set;get;}
    public String rating       {set;get;}
    public String industry     {set;get;}
    public String lastName     {set;get;}
    public String firstName    {set;get;}
    public String email        {set;get;}
    public String opName       {set;get;}
    public String stageName    {set;get;}
    public Date closeDate     {set;get;}
    List<Account> accList;
    public void create(){
        Account acc=new Account();
        acc.Name=accName;
        acc.Rating=rating;
        acc.Industry=industry;
        insert acc;
        //sharooq1st
        // new change in newBranch1
        Contact con=new Contact();
        con.LastName=lastName;
        con.FirstName=firstName;
        con.Email=email;
        con.AccountId=acc.Id;
        insert con;
        Opportunity op=new Opportunity();
        op.Name=opName;
        op.CloseDate=closeDate;
        op.StageName=stageName;
        op.AccountId=acc.Id;
        insert op;
    }
    
}