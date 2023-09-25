({
	invoke : function(component, event, helper) {
		var name=component.get("v.ObjName");
        var fld=component.get("v.FieldName");
        var action=component.get("c.getData");
        action.setParams({
            "objName":name,
            "fldName":fld
        });
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS"){
                var res=response.getReturnValue();
                component.set("v.result",res);
                console.log(res);
            }
        });
        $A.enqueueAction(action);
	}
})