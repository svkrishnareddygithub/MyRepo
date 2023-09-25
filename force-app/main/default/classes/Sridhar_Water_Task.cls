public class Sridhar_Water_Task {
    public static void call(){
        integer count=0;
         integer[] i=new integer[]{0,1,0,2,1,0,1,3,2,1,2,1};
             for(integer k=0;k<i.size();k++){
                integer tempValFirst=i[k];
                 integer tempNext=0;
                 if(k<=i.size()-3){
                     for(Integer j=k+1;j<i.size()-k;j++){
                         if(tempValFirst>=i[j]){
                             tempNext=i[j];
                             break;
                         }
                     }
                 }
                 System.debug(tempNext);
                k=i[tempNext];
             }
        system.debug(count);
    }
}