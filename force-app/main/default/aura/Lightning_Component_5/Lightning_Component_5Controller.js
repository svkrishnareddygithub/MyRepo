({
	add : function(component, event, helper) {
		var av=component.find("Aval").get("v.value");
        var bv=component.find("Bval").get("v.value");
        var res=parseInt(av)+parseInt(bv);
        component.find("Result").set("v.value",res);
	},
    mul : function(component, event, helper) {
		var av=component.find("Aval").get("v.value");
        var bv=component.find("Bval").get("v.value");
        var res=parseInt(av)*parseInt(bv);
        component.find("Result").set("v.value",res);
	}
})