@isTest
public class Contact_Test {
    @isTest  static void call(){
  /*     Contact_Test.main();
        Contact_Insert ci=new Contact_Insert();
        ci.saveCon();
        List<Contact> con=[select id,lastName from Contact];
        List<Contact>contacts=[select id,lastName from Contact limit 30];
        Contact s=[select id,lastName,firstName,phone,email from Contact limit 1];
        integer count=con.size();
        System.assertEquals(ci.lastName,s.LastName);
      System.assertEquals(ci.firstName,s.firstName);
    */  
    }
    public static void main(){
        for(integer i=1; i<=50; i++){
            Contact c=new Contact();
            c.lastname='Krishna'+i;
            c.FirstName='reddy';
                                               
            insert c;
        }
    }
}