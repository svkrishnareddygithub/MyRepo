({
	call : function(component, event, helper) {
		var evt=component.getEvent("firstCall");
        evt.setParams({"Name":"Krishna"});
        evt.fire();
	}
})