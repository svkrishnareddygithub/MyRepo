@isTest
public class Test_Ex3 {
  @isTest
    public static void call(){
        Example3 e=new Example3();
        e.main('krishna','20222','banking');
        integer count=[select count() from Account];
        System.assertEquals(1, count);
    }
   @isTest
        public static void main(){
            Example3 e1=new Example3();
           Test_Ex3.invoke();
        e1.updateData();
            integer c=[select count() from Account];
       System.assertEquals(1,c);
    }
    @isTest
    public static void one(){
       Test_Ex3.invoke();
        Example3 e2=new Example3();
        e2.deleteAcc();
        integer count=[select count() from Account where createdDate=TODAY];
        System.assertEquals(0,count);
    }
    @isTest
    public static void leadTest(){
       // Test_Ex3.lead();
        Example3 e4=new Example3();
        e4.lead('krishna','reddy','company');
        List<Lead> l=[select id,lastName,firstName from Lead];
        System.assertEquals(1,l.size());    
    }
    @isTest
    public static void lTest(){
        Example3 e5=new Example3();
        e5.dupLead('krishna','reddy','company');
        e5.dupLead('krishna','reddy','company');
        integer i=[select count() from Lead where lastName='krishna'];
        System.assertEquals(1,i);
    }
    @isTest
    public static void upop(){
        Test_Ex3.callMe();
        Example3 e6=new Example3();
         e6.call();
        Opportunity opp=[select id,name,closeDate,stageName from Opportunity];
        System.assertEquals('prospecting', opp.stageName);
        System.assertEquals(System.today()+15, opp.closeDate);
    }
    @isTest
    public static void owner(){
        Test_Ex3.callMe();
        Example3 e=new Example3();
        e.ownerChange();
        User u=[select id,name from User where alias='integ'];
        Opportunity o=[select id ,stagename,closeDate from Opportunity ];
        System.assertEquals(u.Id,o.Id);
    }
    public static void callMe(){
        Opportunity o=new Opportunity();
        o.Name='anji';
        o.stageName='Qualification';
        o.CloseDate=System.today();
        insert o;
    }
    public static void invoke(){
        Account acc=new Account();
        acc.Name='raja';
        acc.Rating='Hot';
        insert acc;
    }
   
}