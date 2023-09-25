({
	doInit : function(component, event, helper) {
		var name=event.getParam("myName");
        var action=component.get("c.data");
        action.setParams({"accId":name});
        action.getCallback(this,function(response){
            var state=response.getState();
                var res=component.getReturnValue();
                component.set("v.contacts",res);
            console.log(res);
        });
        $A.enqueueAction(action);
        
	}
})