({
	add : function(component,event) {
		
        var num1 = component.get("v.num1");
        var num2 = component.get("v.num2");
        //Calling apex method
        var action = component.get("c.add");
        //set the parameter values
        action.setParams({
            a : num1,
            b : num2
        });
        
        //Receive the result and perfom the logic
        action.setCallback(this,function(response){
                           
            if(response.getState() == "SUCCESS"){
                var result = response.getReturnValue();
                
                component.set("v.result",result);
            }else{
                alert('Failed to perfrom action');
            }
                           });
        
        //Actually calling the apex method
        $A.enqueueAction(action);
	}
})