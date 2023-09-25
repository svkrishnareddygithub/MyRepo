({
    call :function (component,event,helper){
        var name=component.get("v.name");
        var sal=component.get("v.salary");
        var exp=component.get("v.exp");
        var bon=0;
        if(exp>2){
            bon=sal*0.4;
        }else{
             bon=sal*0.2;
        }
        component.set("v.bonus",bon);
    }
    
})