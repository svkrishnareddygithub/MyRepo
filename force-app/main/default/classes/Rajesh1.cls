public class Rajesh1 {
    public void call(){
        List<Integer> il=new List<Integer>{12,19,20,21,22,70,80,100,40,41,42,43,44,45,98,65};
            List<Integer> ino=new List<Integer>();
        integer temp=0;
            for(Integer i=0; i< il.size()-2; i++){
                	if(il[0]-il[1]==1 || il[1]-il[0]==1 && temp==0)
                    {
                        ino.add(il[0]);
                        temp =1;
                    }
               		
                    if(il[i+1]-il[i]==1 || il[i+1]-il[i+2]==1 || il[i+2]-il[i+1]==1){
                        ino.add(il[i+1]);
                        
                    }
                    
            }
        if(il[il.size()-1]-il[il.size()-2]==1 || il[il.size()-2]-il[il.size()-1]==1)
		{
            ino.add(il[il.size()-1]);
		}
        for(integer g:ino)
        {
        System.debug(g);
        }
    }
}