({
	add : function(component,event) {
		
        var num1 = component.get("v.number1");
        var num2 = component.get("v.number2");
        
        var result = parseInt(num1) + parseInt(num2);
        
        component.set("v.result",result);
	}
})