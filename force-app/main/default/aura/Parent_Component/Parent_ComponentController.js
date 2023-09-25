({
	invoke : function(component, event, helper) {
		var name=event.getParam("Name");
        component.set("v.MyName",name);
        console.log(name);
	}
})