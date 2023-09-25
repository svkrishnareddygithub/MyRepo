public class TestClass {
    public void call(){
        Account acc=new Account();
        acc.name='saam';
        acc.rating='Hot';
        insert acc;
        Contact c=new Contact();
        c.lastName='mani';
        c.firstName='potluri';
        c.email='abc@asd.com';
        insert c;
    }
}