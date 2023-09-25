({
	call : function(component, event, helper) {
		var name=component.find("accName").get("v.value");
        var action=component.get("c.getCon");
        action.setParams({"name":name});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS"){
                var res=response.getReturnValue();
                component.set("v.contacts",res);
                console.log(res);
            }else{
                console.log("failed");
            }
        });
        $A.enqueueAction(action);
	}
})