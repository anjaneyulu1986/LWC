({
    handleColorChange : function(component, event, helper) {

        console.log('On color change :: '+event.getParam('colorCode'));
        component.set("v.colorCodeText",event.getParam('colorCode'));
    }
})