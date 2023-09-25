public class Pagination_Ex_2 {
    public integer size  {set;get;}
    public integer totalPages {set;get;}
    public ApexPages.StandardSetController con  {set;get;}
    public integer totalRecords {set;get;}
    public List<selectOption> options {set;get;}
    
    public Pagination_Ex_2(){
      List<Account> aList=[select id,name,rating,phone from Account];
      System.debug('First');
      con=new Apexpages.StandardSetController(aList);
      con.setPageSize(5);
      totalRecords=con.getResultSize();
      integer i=Math.mod(totalRecords,5);
        if(i>0){
            totalPages=(totalRecords/5)+1;
        }else{
            totalPages=(totalRecords/5);
        }
      options=new List<selectOption>();
      options.add(new selectOption('5','5'));
      options.add(new selectOption('10','10'));
      options.add(new selectOption('20','20'));
    }
    
    public List<Account> getAccounts(){
        List<Account> accList=(List<Account>)con.getRecords();
        return accList; 
    }
    public void refresh(){
      System.debug('second');
      con.setPageSize(size);
      totalRecords=con.getResultSize();
      integer i=Math.mod(totalRecords,size);
        if(i>0){
            totalPages=(totalRecords/size)+1;
        }else{
            totalPages=(totalRecords/size);
        }
    }
}