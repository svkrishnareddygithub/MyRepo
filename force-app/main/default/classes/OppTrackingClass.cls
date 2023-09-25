public class OppTrackingClass {
    public List<OppServices__c> opp {set;get;}
  //  public List<OppServices__c> oppList {set;get;}
    public boolean flag {get;set;}
    public Opportunity_Track__c o {set;get;}
    public OppTrackingClass(){ 
        opp=new List<OppServices__c>();
      //  oppList=new List<OppServices__c>();
        o=new Opportunity_Track__c();
        callMe();
        flag=false;
    }
    public void callMe(){
        flag=true;
        OppServices__c os=new OppServices__c();
        opp.add(os);
       
    }
    public PageReference invoke(){
        insert o;
        for(OppServices__c v: opp){
            v.OppTrack__c=o.Id;
        }
        insert opp;
        PageReference p=new PageReference('/'+o.Id);
        return p;
        
    }
    public void change(){
        for(OppServices__c s: opp){
            if(s.App__c=='Java'){
                s.Technologies__c='IIoT';
                 opp.add(s);
            }
        }
       
    }
}