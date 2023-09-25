({
	call : function(component, event, helper) {
		var amt=component.find("amount").get("v.value");
        var rate=component.find("rate").get("v.value");
        var years=component.find("years").get("v.value");
        var amount=parseInt(amt);
        var rat=parseInt(rate);
        var yrs=parseInt(years);
        var action=component.get("c.calculate");
        action.setParams({"amount": +amount, "rate": +rat, "years": +yrs });
        action.setCallback(this,function(response){
           var state=response.getState();
                          if(state==='SUCCESS'){
                          var res=response.getReturnValue();
                          component.find("int").set("v.value",res);
                          console.log(res);                        
                         }else{
                          console.log('Error Find');
                         }
         });
         $A.enqueueAction(action);
	}
})