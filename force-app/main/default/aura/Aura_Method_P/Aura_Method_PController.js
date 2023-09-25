({
	invoke : function(component, event, helper) {
		var cm=component.find("cMethod");
        var nm=component.find("name").get("v.value");
        var rat=component.find("rating").get("v.value");
        var ph=component.find("phone").get("v.value");
       // cm.call(nm,rat,ph);
        var action=component.get("c.call");
        action.setParams({"name":nm,"rating":rat,"phone":ph});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state=='SUCCESS'){
                var result=response.getReturnValue();
                console.log("Success");
                cm.call(nm,rat,ph,result);
            }else{
                console.log("failed");
            }
        });
        $A.enqueueAction(action);
	}
})