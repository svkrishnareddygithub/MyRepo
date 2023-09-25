public class Json_Ex4 {
   public  String name ;
    public Json_Ex4(){
        name='{"LastName":"Anil","FirstName":"Kumba","Account":{"Name":"Krishna","Rating":"Warm"},"Salary":"10000"}';
        System.JSONParser jp=JSON.createParser(name);
        while(jp.nextToken()!=null){
            if(jp.getText()=='FirstName'){
                jp.nextToken();
                System.debug('FirstName:'+jp.getText());
            }
            if(jp.getText()=='Account'){
                jp.nextToken();
               Account acc=(Account)jp.readValueAs(Account.class);
                System.debug('Account:'+acc);
            }
            if(jp.getText()=='Salary'){
                jp.nextToken();
                System.debug('Salary:'+jp.getText());
            }
        }
    }
}