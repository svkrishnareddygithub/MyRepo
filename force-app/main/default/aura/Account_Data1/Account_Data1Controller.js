({
	show : function(component, event, helper) {
        var name=component.find("my").get("v.value");
        var evt=$A.get("e.c:Account_Event");
        evt.setParams({"myName":name});
        evt.fire();
	}
})