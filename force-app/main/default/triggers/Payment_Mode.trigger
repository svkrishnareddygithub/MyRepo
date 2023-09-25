trigger Payment_Mode on Order__c (After insert) {
   /*  List<Order__c> cash=new List<Order__c>();
        List<Order__c> loan=new List<Order__c>();
        
        for(Order__c c: trigger.new){
            if(c.Payment_Mode__c == 'Cash'){
                cash.add(c);
            }
            else{
                loan.add(c);
            }
      }
    Product__c p=[select id,Name from Product__c];
       p.By_Cash__c=cash.size();
    p.By_Loan__c=loan.size();
*/
}