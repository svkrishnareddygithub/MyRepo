({
	call : function(component, event, helper) {
		var name=component.getEvent("firstEvent");
        name.setParams({"name":"krishnareddy"});
        //console.log(name);
        name.fire();
	}
})