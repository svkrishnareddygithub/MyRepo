public class Map_Example {
    public Map<String, List<String>> newMap {set;get;}
    public List<SelectOption> cities  {set;get;}
    public List<SelectOption> places  {set;get;}
    public String selected  {set;get;}
    public Map_Example(){
      newMap=new Map<String,List<String>>();
      cities=new List<selectOption>();
      places=new List<SelectOption>();
      List<String> hp=new List<String>{'srNagar','srinagar','ameerpet'};
      List<String> cp=new List<String>{'tnagar','balanagar','beach'};
      newMap.put('Hyd',hp);
      newMap.put('Che',cp);
      SelectOption s=new SelectOption('None','-None-');
      cities.add(s);
      places.add(s);	
     set<String> keys= newMap.keySet();
        for(String p: keys){
            SelectOption s1=new SelectOption(p,p);
            cities.add(s1);
        }
    }
    public void fetch(){
      places.clear();
      SelectOption s2=new SelectOption('None','-None-');
      places.add(s2); 
        if(selected!='None'){
           List<String> getPlaces=newMap.get(selected);
            for(String s3: getPlaces){
                SelectOption s4=new SelectOption(s3,s3);
                places.add(s4);
            }
        }
    }
}