({
	show : function(component, event, helper) {
		var name=component.find("aName").get("v.value");
        var action=component.get("c.call");
        action.setParams({accName:name});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var res=response.getReturnValue();
                component.set("v.contacts",res);
            }
            else{
                console.log("Error");
            }
        });
        $A.enqueueAction(action);
        
	}
})