public class Mass_Delete {
    public List<Account> acc {set;get;}
    
    public Mass_Delete(ApexPages.StandardSetController controller){
        List<String> s=new List<String>{'Name','Phone','Rating','Industry'};
        controller.addFields(s);
        acc=(List<Account>)controller.getSelected();
    }
    public PageReference call(){
        delete acc;
        PageReference p=new PageReference('/001');
        return p;
    }
}