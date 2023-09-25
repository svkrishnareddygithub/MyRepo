public class Speed_Calculation {
    public decimal speed    {set;get;}
    public decimal distance {set;get;}
    public integer timee    {set;get;}
    
    public void speed_Calculation(){
        speed=distance/timee;
    }
}