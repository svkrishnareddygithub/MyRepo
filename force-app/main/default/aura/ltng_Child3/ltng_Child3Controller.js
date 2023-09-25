({
	invoke : function(component, event, helper) {
        var acc=event.getParam("evtAcc");
        var li=component.get("v.acc");
        li.push(acc);
        component.set("v.acc",li);
	}
})