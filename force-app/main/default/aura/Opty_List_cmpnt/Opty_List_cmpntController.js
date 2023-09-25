({
	show : function(component, event, helper) {
        var action=component.get("c.getOpty");
        action.setCallback(this,function(response){
           var state=response.getState();
        if(state==='SUCCESS'){
            var res=response.getReturnValue(); 
            component.set("v.Opptys",res);
	       }
            else{
                console.log("failed");
            }
        });
        $A.enqueueAction(action);
    }
})