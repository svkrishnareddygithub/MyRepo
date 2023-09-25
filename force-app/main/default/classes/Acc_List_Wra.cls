public class Acc_List_Wra {
    public List<CompanyDetails> cd {set;get;}
    public Acc_List_Wra(){
        cd=new List<CompanyDetails>();
        List<Account> accList=[select id,name,phone,rating,industry from Account];
        for(Account a:  accList){
            CompanyDetails c=new CompanyDetails();
            c.name=a.name;
            c.rating=a.rating;
            c.phone=a.phone;
            if(a.industry=='energy'){
                c.amount=50000;
            }
            cd.add(c);
       }
    }
}