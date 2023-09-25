({
	call : function(component, event, helper) {
         alert("jdsj");
        var evt=event.getParam("Name");
        var evtt=event.getParam("Phone");
       
        component.set("v.Name",evt);
        component.set("v.Phone",evtt);
       
	}
})