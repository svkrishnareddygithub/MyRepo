public class Login_Form {
    public string userName {set;get;}
    public string password {set;get;}
    public PageReference call(){
        PageReference p;
        List<Lead> ld=[select id,lastName,company,status,UserName__c,MobilePhone from Lead];
        for(Lead l: ld){
            if(l.UserName__c==userName && l.MobilePhone==password){
              p=new PageReference('https://websynergies-dev-ed.my.salesforce.com/a0F/o');
            }
        }
        return p;
    }
}