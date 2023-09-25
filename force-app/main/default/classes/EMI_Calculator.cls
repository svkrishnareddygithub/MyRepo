public class EMI_Calculator {
    public Decimal  principle {set;get;}
    public Decimal rate       {set;get;}
    public Integer timee      {set;get;}
    public Decimal total      {set;get;}
    /*public EMI_Calculator(){
        principle=0;
        rate=0;
        timee=0;
        total=0;
    }
  */
    public void calculation(){
        total=principle*(1+rate*timee);
    }
    
}