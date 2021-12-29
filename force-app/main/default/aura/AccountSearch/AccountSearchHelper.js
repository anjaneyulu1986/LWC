({
    fetchAccounts : function(component,event) {
        
        var searchString = component.get("v.searchString");
        
        var action = component.get("c.getAccounts");
        action.setParams({
            searchString:searchString
        });
        
        if(searchString == ''){
            
            component.find('notification').showToast({
                "title": "Warning!",
                "message": "Please enter the search string...",
                "variant":"warning"  ,
                "mode":"sticky"
            });
            
            return;
        }
        action.setCallback(this,function(response){
            
            if(response.getState() === 'SUCCESS'){
                component.set("v.isResultShow",false);
                var accounts = response.getReturnValue();
                if(accounts.length > 0){
                    component.set("v.isResultShow",true);
                }else{
                    component.find('notification').showToast({
                        "title": "Success!",
                        "message": "No matching records are found...",
                        "variant":"info"    
                    });
                }
                component.set("v.accountList",response.getReturnValue());
            }else{
                component.find('notification').showToast({
                    "title": "Error!",
                    "message": "Something went wrong..Please contact administrator",
                    "variant":"error"    
                });
            }
        });
        
        $A.enqueueAction(action);
    }
})