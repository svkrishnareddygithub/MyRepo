public class Poc_dashboard {

  @AuraEnabled(cacheable=true)
  public static List<Integer> technologies(){
    List<Integer> intList=new List<Integer>();
    integer a=0;
    integer b=0;
    integer c=0;
    integer d=0;
    integer e=0;
    integer f=0;
    List<OppServices__c> listServices= [select id,App__c,Technologies__c,OppTrack__c from OppServices__c WHERE OppTrack__c!=null];
    for(OppServices__c v:listServices){
        String nm=v.Technologies__c;
        
       if (nm.contains('Oracle')){
        a+=1;
       }else if(nm.contains('Selenium')){
        b+=1;
       }else if(nm.contains('Asset Health Insight')){
        c+=1;
       }else if(nm.contains('Appium')){
        d+=1;
       }else if(nm.contains('Dot Net')){
        e+=1;
       }else{
        f+=1;
       }
    }
    intList.add(a);
    intList.add(b);
    intList.add(c);
    intList.add(d);
    intList.add(e);
    intList.add(f);
    return intList;
  }


}