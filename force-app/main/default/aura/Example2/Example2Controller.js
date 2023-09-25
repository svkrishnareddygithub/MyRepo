({
	add : function(component, event, helper) {
	  var Aval=component.find("aval").get("v.value");
        var Bval=component.find("bval").get("v.value");
        var  Cval=parseInt(Aval)+parseInt(Bval);
        component.find("res").set("v.value", Cval);
	},
    mul : function(component,event,helper){
        var aval=component.find("aval").get("v.value");
        var bval=component.find("bval").get("v.value");
        var cval=parseInt(aval)*parseInt(bval);
        component.find("res").set("v.value",cval);
    }
})