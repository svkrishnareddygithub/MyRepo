({
	call : function(component, event, helper) {
		var name=component.get("v.newAcc");
        var evt=$A.get("e.c:ltng_App_Event");
        evt.setParams({"evtAcc":name});
        evt.fire();
	},
  /*  clear : function (component,event,helper){
        component.set("v.newAcc",'');
    }
    */
})