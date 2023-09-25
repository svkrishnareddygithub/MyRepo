public class Aura_Example_1 {
   @AuraEnabled
    public static Decimal calculate(Integer amount, Integer rate, Integer years){
        Decimal intrest=(amount*rate*years)/100;
        return intrest;
    }
}