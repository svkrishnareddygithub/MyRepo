({
	invoke : function(component, event, helper) {
		var acc=event.getParam("accName");
        component.set("v.myName",acc);
        console.log("Account Name" +acc);
	}
})