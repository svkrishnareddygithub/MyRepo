@isTest
public class Test_Opty {
    public static void main(){
        Opportunity op=new Opportunity();
        op.Name = 'mani';
        op.StageName = 'Prospecting';
        insert op;
    }
}