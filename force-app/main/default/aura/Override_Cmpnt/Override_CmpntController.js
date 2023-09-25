({
    submit: function(component,event,helper){
        var name=component.find("name").get("v.value");
        var phone=component.find("phone").get("v.value");
        var industry=component.find("industry").get("v.value");
        var action=component.get("c.create");
        console.log(name);
        console.log(phone);
        console.log(industry);
        action.setParams({
            "name":name,
            "phone":phone, 
            "industry":industry
        });
        
         action.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
              var myId = response.getReturnValue(); 
                console.log(myId);
                var eevt=$A.get("e.force:navigateToSObject");
                eevt.setParams({recordId :myId}); 
                eevt.fire();
            }
        });
        $A.enqueueAction(action);
    },
      
    
    cancel: function(component,event,helper){
        component.find("name").set("v.value",'');
        component.find("phone").set("v.value",'');
        component.find("industry").set("v.value",'');
        var evt=$A.get("e.force:showToast");
        evt.setParams("title","Reset Value","Message","record reset successfully");
        evt.fire();
    }
   
})