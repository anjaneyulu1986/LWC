({
	fetchAccounts : function(component, event, helper) {
        
        helper.fetchAccounts(component,event);
		
	},
    showSpinner: function(component,event,helper){
        
        var spinner = component.find("spinner");
        
        $A.util.removeClass(spinner,'slds-hide');
    },
    hideSpinner : function(component,event,helper){
        var spinner = component.find("spinner");
        $A.util.addClass(spinner,'slds-hide');
    }
})