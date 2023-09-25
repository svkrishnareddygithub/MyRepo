trigger Lead_Merge on Lead (before insert) {
    List<Lead> li=[select id,name,phone,email,company from lead];
    for(Lead l: li){
        for(Lead ll: trigger.new){
            if(ll.Name==l.Name && ll.Email==l.Email && ll.Phone==l.Phone){
                merge l ll;
            }
        }
    }

}