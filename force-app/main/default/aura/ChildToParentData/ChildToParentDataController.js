({
	handleMe : function(component, event, helper) {
		var nm=component.find("nm").get("v.value");
        var ph=component.find("ph").get("v.value");
        var evt=component.getEvent("one");
        evt.setParams({"Name":nm,"Phone":ph});
        evt.fire();
        
	},
    doInit  :function(component,event,helper){
        var name=event.getParam("Name");
        var pho=event.getParam("Phone");
        component.set("v.aName",name);
        component.set("v.aPhone",pho);
    }
})