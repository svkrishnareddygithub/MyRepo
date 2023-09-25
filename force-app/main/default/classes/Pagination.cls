public class Pagination {
    public integer size   {set;get;}
    public integer totalpages {set;get;}
    public List<SelectOption> options {set;get;}
    public ApexPages.StandardSetController controller  {
        get{
        if(controller==null){
            controller=new ApexPages.StandardSetController(Database.getQueryLocator([select id,name,rating,phone from Account]));
            controller.setPageSize(size);
            controller.getResultSize();
        }
        return controller;
    }
    set;}
    
    public Pagination(){
        size=10;
        options=new List<SelectOption>();
        options.add(new SelectOption('5','5'));
        options.add(new SelectOption('10','10'));
        options.add(new SelectOption('20','20'));
    }
    public List<Account> getAccounts(){
        List<Account> accList=controller.getRecords();
        return accList;
    }
    public void refreshPageSize(){
        controller.setPageSize(size);
      //  return null;
    }
}