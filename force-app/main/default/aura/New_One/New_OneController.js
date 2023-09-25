({
	show : function(component, event, helper) {
        var col=[{label:"Name",fieldName:"Name",type:"text"},
                 {label:"Phone",fieldName:"Phone",type:"text"},
                 {label:"Industry",fieldName:"Industry",type:"text"}
                 ];
        component.set("v.columns",col);
        var action=component.get("c.call");
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var res=response.getReturnValue();
                component.set("v.records",res);
                console.log(res);
            }
        });
        $A.enqueueAction(action);
        
	}
})