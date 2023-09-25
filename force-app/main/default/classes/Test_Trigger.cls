@isTest
public class Test_Trigger {
    static testMethod void call(){
        Questions__c q=new Questions__c();
        q.name='dev';
        insert q;
     /*   Answer__c a=new Answer__c();
        a.Name='coding';
        a.question__c=q.question__c;
        insert a; 
*/
    }
}