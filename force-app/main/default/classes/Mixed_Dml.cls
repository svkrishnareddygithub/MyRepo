public class Mixed_Dml {
    public void create(){
        Profile p=[select id,name from Profile where name='Standard User'];
        UserRole r=[select id from UserRole where Name='COO'];
        User u=new User(lastName='Anji', alias='potu',email='abc@xyz.com',emailencodingkey='UTF-8',languagelocalekey='en_US',
                       timezonesidkey='America/Los_Angeles',userName='raama@jjhh.com',profileId=p.Id, userRoleId=r.Id,
                       localesidkey='en_US');
        insert u;
        call();
    }
    @future
    public static void call(){
         Account acc=new Account();
        acc.name='krishna';
        insert acc;
        show();
    }
    @future 
    public static void show(){
        
    }
}