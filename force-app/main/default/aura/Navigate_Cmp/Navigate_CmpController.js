({
	prev : function(component, event, helper) {
	   var num=component.get("v.steps");
        var count=parseInt(num);
        count=count-1;
        component.set("v.steps",''+count);
	},
    next :function(component,event,helper){
        var num=component.get("v.steps");
        var count=parseInt(num);
        count=count+1;
        component.set("v.steps",''+count);
    }
})