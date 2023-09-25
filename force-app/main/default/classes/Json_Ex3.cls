public class Json_Ex3 {
    public String name ;
    public Json_Ex3(){
        name='{"Status":"Success","Code":"200","Accounts":[{"Name":"Krishna","Rating":"Cold"},{"Name":"Raju","Rating":"Hot"}]}';
        System.debug(name);
        
        System.JSONParser jp=JSON.createParser(name);
        while(jp.nextToken()!=null){
            if(jp.getText()=='Status'){
                jp.nextToken();
                System.debug('Status:' +jp.getText());
            }
            if(jp.getText()=='Code'){
                jp.nextToken();
                System.debug('Code:' +jp.getText());
            }
            if(jp.getText()=='Accounts'){
                jp.nextToken();
                List<Account> accounts=(List<Account>)jp.readValueAs(List<Account>.class);
                System.debug('Accounts:'+accounts);
            }
        }
        
    }
}