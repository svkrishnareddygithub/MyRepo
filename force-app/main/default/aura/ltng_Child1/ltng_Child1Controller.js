({
	show : function(component, event, helper) {
         var acc=event.getParam("evtAcc");
        component.set("v.Name",acc.Name);
        component.set("v.Rating",acc.Rating);
        component.set("v.Phone",acc.Phone);
	}
})