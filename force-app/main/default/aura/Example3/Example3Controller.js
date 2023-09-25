({
	call : function(component, event, helper) {
		var aval=component.get("v.Aval");
        var bval=component.get("v.Bval");
        var cval=parseInt(aval)+parseInt(bval);
        component.set("v.Result",cval);
	}
})