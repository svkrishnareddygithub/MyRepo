({
	call : function(component, event, helper) {
		var name=event.getParam("accName");
        console.log(name);
        var action=component.get("c.getContacts");
        action.setParams({"name":name});
        action.setCallback(this,function(response){
          var state=response.getState();
            if(state=='SUCCESS'){
             var res=response.getReturnValue();
              component.set("v.con",res);
                console.log(res);
            }else{
                console.log('failed');
            }
        });
        $A.enqueueAction(action);
	}
})