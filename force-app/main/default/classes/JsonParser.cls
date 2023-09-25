public class JsonParser {
    public void call()
    {
        string name='';
        string phone='';
        string rating='';
        List<Account> accList=new List<Account>();
        string s='{"Accounts":[{"Name":"saravana3","Phone":"9099900","Rating":"hot"},'
        +'{"Name":"saravana4","Phone":"9099900","Rating":"hot"}]}';
        System.JSONParser jp=Json.createParser(s);
        while(jp.nextToken()!=null)
        {
            List<Account> acc=new List<Account>();
            if(jp.getText()=='Accounts')
            {
                jp.nextToken();
                acc=(List<Account>)jp.readValueAs(List<Account>.class);
            }
            /*if(jp.getText()=='Name')
            {
                jp.nextToken();
                name=jp.getText();
            }
            if(jp.getText()=='Phone')
            {
                jp.nextToken();
                phone=jp.getText();
            }
            if(jp.getText()=='Rating')
            {
                jp.nextToken();
                rating=jp.getText();
            }
            boolean temp =false;
             Account acc=new Account();
            	if(name!=''){
                    acc.Name=name;
                    temp=true;
           		 }
            	if(rating!=''){
                    acc.Rating=rating;
            	}
            	if(phone!=''){
                    acc.Phone=phone;
            	}
              if(temp==true)
                accList.add(acc);*/
            if(acc.size()>0)
            accList.addAll(acc);
            
        }
       
        insert accList;
    }
}