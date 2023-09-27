public class Acc_Opp_Update {
   public static void updateOpty(List<Account> accList){
       List<Opportunity> oList=new List<Opportunity>();
       List<Opportunity> opList=[select Name,StageName,CloseDate,AccountId from Opportunity where AccountId IN: accList ];
       for(Opportunity o: opList){
           if( o.StageName!='Closed Won'){
               o.StageName='Close Lost';
               o.CloseDate=System.today();
               oList.add(o);
           }
       }
       update oList;
       //testBranch Update
       //kamal,jan,saam
   }
}