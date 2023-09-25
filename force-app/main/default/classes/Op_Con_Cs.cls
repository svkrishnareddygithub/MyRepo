public class Op_Con_Cs {
  @AuraEnabled 
    public static List<Contact> getCon(){
        List<Account> accs=[select id,name,phone,rating from Account ];
        List<Contact> cons=[select id,lastName ,firstName from Contact where AccountId IN:accs];
        return cons;
    }
    @AuraEnabled
    public static List<Opportunity> getOpty(){
         List<Account> accs=[select id,name,phone,rating from Account ];
        List<Opportunity> opty=[select id,name,stageName,closeDate from Opportunity where AccountId IN: accs];
        return opty;
    }
}