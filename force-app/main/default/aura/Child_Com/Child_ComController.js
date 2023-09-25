({
	invoke : function(component, event, helper) {
		var evt=component.getEvent("SecondCall");
        evt.setParams({"Name":"Krishna"});
        evt.fire();
	},
    show: function(component,event,helper){
        var name=event.getParam("Name");
        component.set("v.Name",name);
    }
})