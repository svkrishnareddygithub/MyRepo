public class Get_Opp {
@AuraEnabled
    public static List<Opportunity> getOpty(){
        List<Opportunity> opty=[SELECT Id, Name, StageName, CloseDate FROM Opportunity];
        return opty;
    }
}