public class Acc_Con_Opp {
    public Account acc {set;get;}
    public Contact con {set;get;}
    public Opportunity opp {set;get;}
    
    public void call(){
        acc=new Account();
        acc.Name='manish';
        insert acc;
        con=new Contact();
        con.LastName='sanju';
        con.AccountId=acc.Id;
        insert con;
        opp=new Opportunity();
        opp.CloseDate=system.today();
        opp.StageName='prospecting';
        opp.Name='Ac';
        opp.AccountId=acc.Id;
        insert opp; 
  }
}