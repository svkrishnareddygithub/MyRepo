@isTest
public class Test_Ex1 {
  @isTest
    public static void main(){
        Example1 e=new Example1();
        e.call();
        System.assertEquals('krishna',e.name);
        System.assertEquals('hyd',e.city);
    }
}