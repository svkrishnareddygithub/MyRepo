public class Wra_Selec_Acc {
    public List<Selected_Acc> wList {set;get;}
    public List<Selected_Acc> sel   {set;get;}
    public boolean bl                {set;get;}
    
     public Wra_Selec_Acc (){
        wList=new List<Selected_Acc>();
        sel=new List<Selected_Acc>();
         bl=false;
    }
    
    public  List<Selected_Acc> getRecords(){
        List<Account> accList=[select id,name,rating from Account];
        for(Account a: accList){
            Selected_Acc sa=new Selected_Acc();
            sa.acc=a;
            sa.flag=false;
            wList.add(sa);
        }
        return wList;
    }
    
    public void call(){
        sel.clear();
        for(Selected_Acc a: wList){
            if(a.flag==true){
                sel.add(a);
            } 
        }
    }
    public void invoke(){
        
           for(Selected_Acc a: wList){
               a.flag=true;
             
        }
    }
    
    
public class Selected_Acc{
    public Account acc  {set;get;}
    public boolean flag {set;get;}
 }
}