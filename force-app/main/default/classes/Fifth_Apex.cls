public class Fifth_Apex {
    public List<SelectOption> options {set;get;}
    public list<String> fields  {set;get;}
    public List<Account> accList {set;get;}
    public Account acc {set;get;}
    public Fifth_Apex(){
        options=new List<SelectOption>();
        accList=new List<Account>();
        acc=new Account();
        fields=new list<String>{'Hyd','Che','Ban'};
            for(String s: fields){
                SelectOption so=new SelectOption(s,s);
                options.add(so);
            }
    }
    public void call(){
        accList=[select id,name,rating,industry,email__c,phone from Account limit 6];
        
    }    
}