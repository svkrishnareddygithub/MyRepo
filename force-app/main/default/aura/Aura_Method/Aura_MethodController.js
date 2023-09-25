({
	call : function(component, event, helper) {
		var params=event.getParam("arguments");
        var name=params.accName;
        var rating=params.accRating;
        var phone=params.accPhone;
        var idss=params.accId;
        component.set("v.Name",name);
        component.set("v.Rating",rating);
        component.set("v.Phone",phone);
        component.set("v.ids",idss);
	}
})