public class Wrapper_Class_Columns {
    public List<Wrapp_List> wl {set;get;}
    public List<Contact> co  {set;get;}
    
    public  Wrapper_Class_Columns(){
        wl=new List<Wrapp_List>();
        co=new list<Contact>();
    }

    public List<Wrapp_List> getRecords(){
        List<Account> accList=[select id,name,(select id,lastName from Contacts),(select id,name,stageName from Opportunities)
                                 from Account];
        for(Account a: accList){
            Wrapp_List w=new Wrapp_List();
            w.acc=a;
            w.con=a.contacts;
            w.opty=a.opportunities;
            w.flag=false;
            wl.add(w);
        }
        return wl;
    }
    public void conList(){
        for(Wrapp_List l: wl){
            if(l.flag==true){
                co=l.acc.contacts;
            }
        }
    }
    
public class Wrapp_List{
        public Account acc {set;get;}
        public List<Contact> con {set;get;}
        public List<Opportunity> opty {set;get;}
        public boolean flag   {set;get;}
    }
}