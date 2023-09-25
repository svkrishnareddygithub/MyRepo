({
	call : function(component, event, helper) {
        var evt=component.getEvent("thirdCall");
        evt.setParams({"accName":"Krishna"});
        evt.fire();
	}
})