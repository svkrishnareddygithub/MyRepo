@isTest
public class Test_Ex2 {
  @isTest
    public static void main(){
        Example2 e=new Example2();
        e.industry='Energy';
        e.call();
        System.assertEquals('Hot',e.rating);
        System.assertEquals('New',e.status);
        e.industry='Bank';
        e.call();
        System.assertEquals('Cold',e.rating);
        System.assertEquals('Reg',e.status);
    }
}