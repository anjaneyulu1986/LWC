({
	handleEvent : function(component, event, helper) {
		
        var appEvent = $A.get("e.c:appEvent");
        //var cmpEvent = Component.getEvent("name");
        appEvent.setParams({
            message:component.get("v.message")
        });
        
        appEvent.fire();
	}
})