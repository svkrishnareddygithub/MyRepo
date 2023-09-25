({
	call : function(component, event) {
		var Amount=component.get("v.Amount");
        console.log("Amount:" +Amount);
        var Rate=component.get("v.Rate");
        console.log("Rate:" +Rate);
        var Years=component.get("v.Years");
        console.log("Years:" +Years);
        var Intrest=(Amount*Rate*Years)/100;
        component.set("v.Intrest",Intrest);
        console.log("Intrest:" +Intrest);
	}
})