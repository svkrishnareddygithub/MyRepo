public class Example3 {
    public void main(String name, String phone, String industry){
        Account acc=new Account();
        acc.name=name;
        acc.Phone=phone;
        acc.Industry=industry;
        insert acc;
    }
    public void updateData(){
        List<Account> ac=[select id,name,rating from Account];
        for(Account a: ac){
            a.Rating='Cold';
        }
        update ac;
    }
    public void deleteAcc(){
        List<Account>accounts=[select id,name from Account where createdDate=TODAy];
        delete accounts;
    }
    public void lead(String lastName, String firstName, String company){
             Lead l=new Lead();
             l.LastName=lastName;
             l.firstName=firstName;
             l.company=company;   
           insert l;
    }
    public void dupLead(String lastName, String firstName,String company){
        integer c=[select count() from lead where firstName=:firstName];
        if(c<=0){
            Lead l=new Lead();
        l.lastname=lastName;
        l.firstName=firstName;
        l.company=company;
        insert l; 
        }
    }
    public void call(){
        List<Opportunity> o=[select id,stageName,closeDate from Opportunity];
        for(Opportunity op: o){
            op.stageName='prospecting';
            op.closeDate=System.today()+15;
        }
        update o;
    }
    public void ownerChange(){
        List<Opportunity> op=[select id,name,stageName,closeDate from Opportunity];
        user u=[select id,name from User where alias='integ'];
        for (Opportunity o: op){
            o.ownerId=u.Id;
        }
        update op;
    }
}