public class Acc_Duplicate {
    public Account acc {set;get;}
    public Acc_Duplicate(){
        acc=new Account();
    }
    //changes from star2 branch
    public PageReference call(){
        PageReference p;
        List<Account> accList=[select id,Name,Rating,Phone from Account where name=:acc.name];
        integer count=accList.size();
        if(count>0){
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.ERROR,'duplicate record');
            ApexPages.addMessage(msg);
        }else{
           insert acc;
            p=new PageReference('/'+acc.id);
        }
        return p;
    }
}