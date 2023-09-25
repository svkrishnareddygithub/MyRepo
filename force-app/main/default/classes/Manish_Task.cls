public class Manish_Task {
  public decimal units ;
  public decimal amount;
  public decimal temp;
    public void call(){
        if(units>0 && units<=500){
            amount=units*1;
        }
        else if(units>=500 && units<=1000){
            temp=units-500;
            amount=(temp*2)+500;
        }
        else if(units>1000 && units<=1500){
            temp=units-1000; 
            amount=(temp*3)+(500*2)+500;
        }
    }
}