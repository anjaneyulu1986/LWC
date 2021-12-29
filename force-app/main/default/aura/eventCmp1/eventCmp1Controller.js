({
	handleClick : function(component, event, helper) {
		
        var cmpEvent = component.getEvent("cmpEvent");
        cmpEvent.setParams({
            message :component.get("v.message"),
            number : component.get("v.number")
        });
        cmpEvent.fire();
	}
})