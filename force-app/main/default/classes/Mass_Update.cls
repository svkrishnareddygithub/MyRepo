public class Mass_Update {
    public List<Opportunity> opty {set;get;}
    public Mass_Update(ApexPages.StandardSetController controller){
        opty=(List<Opportunity>)controller.getSelected();
    }
    public PageReference call(){
        for(Opportunity op: opty){
            op.stageName='Closed Won';
        }
        update opty;
        PageReference p=new PageReference('/006');
        return p;
    }
    
}