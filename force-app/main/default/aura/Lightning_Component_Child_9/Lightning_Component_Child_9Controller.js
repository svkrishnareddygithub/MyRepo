({
	call : function(component, event, helper) {
		var name=component.find("accName").get("v.value");
        var evt=$A.get("e.c:Lightning_Component_Event_9");
        evt.setParams({"accName":name});
        evt.fire();
	}
})