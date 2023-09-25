global class Leads_Delete implements schedulable {
    global void execute(System.SchedulableContext sc){
        Lead_Shedulable ls=new Lead_Shedulable();
        ls.invoke();
    } 
}