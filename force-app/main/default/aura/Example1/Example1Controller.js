({
	call : function(component, event, helper) {
		var name=component.get("v.Name");
        var sal=component.get("v.Salary");
        
        console.log("Name:" +name);
       
        console.log("Salary:" +sal);
	}
})