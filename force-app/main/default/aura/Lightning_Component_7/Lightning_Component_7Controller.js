({
	result : function(component, event, helper) {
		var abc=component.get("c.call");
        abc.setCallback(this,function(response){
            var state=response.getState();
            if(state=='SUCCESS'){
                var result=response.getReturnValue();
                component.set("v.name",result);
            }else{
                console.log('failed');
            }
        });
        $A.enqueueAction(abc);
	}
})