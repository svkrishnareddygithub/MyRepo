public class Json_Ex2 {
    public String name {set;get;}
    public Map<String,Object> mapObj {set;get;}
    public Json_Ex2(){
        name='{"Name":"Krishna","Marks":[10,20,30],"City":"Hyd"}';
        mapObj=new Map<String,Object>();
        System.JSONParser jp=JSON.createParser(name);
        while(jp.nextToken()!=null){
            mapObj.put(jp.getText(),jp.getCurrentToken());
            
        }
    }
}