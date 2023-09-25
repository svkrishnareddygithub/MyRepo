public class Prime_Number {
    public String prime  {set;get;}
    public Integer num     {set;get;}
    public void call(){
        integer count=0;
        for(Integer i=1; i<num; i++){
            integer x=Math.mod(num, i);
            if(x==0){
                count++ ;
            }
        }
        if(count>1){
           prime='It is not a prime';
            
             
        }
        else {
            prime='It is a Prime Number';
        }
        
    }
}