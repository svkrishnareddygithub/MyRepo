public class Acc_Con_Opp {
    public Account acc {set;get;}
    public Contact con {set;get;}
    public Opportunity opp {set;get;}
    
    public void call(){
        acc=new Account();
        acc.Name='manish';
        insert acc;
        opp=new Opportunity();
        opp.CloseDate=system.today();
        opp.StageName='prospecting';
        opp.Name='Ac';
        opp.AccountId=acc.Id;
        insert opp;
        con=new Contact();
        con.LastName='sanju';
        con.AccountId=acc.Id;
        insert con;
  }
}