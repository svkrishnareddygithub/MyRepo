public class Rajesh {
    public  void call(){
      List<Integer> iList=new List<Integer>{10,20,30,40,50};
      List<Integer> newList=new List<Integer>();
        for(Integer i=iList.size()-1; i>0; i--){
           newList.add(iList[i]);
        }
        for(Integer l: newList){
            System.debug(l);
        }
    }
}