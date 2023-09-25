({
	call : function(component, event, helper) {
		var fname=component.find("fName").get("v.value");
        console.log(fname);
        var lname=component.find("lName").get("v.value");
        console.log(lname);
        var name=fname+lname;
        component.set("v.Name",name);
	}
})