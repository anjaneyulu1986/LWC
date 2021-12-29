({
	handleEvent : function(component, event, helper) {
		component.set("v.message",event.getParam("message"));
        component.set("v.number",event.getParam("number"));
	}
})