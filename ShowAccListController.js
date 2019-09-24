({
	doInit : function(component, event, helper) {
		//var accList = Component.get('v.accList');
        var action = component.get('c.getAccount');
        action.setCallback(this,function(response){
            if(response.getState()==="SUCCESS"){
                console.log(response.getReturnValue());
                component.set('v.accList',response.getReturnValue());
            } else {
                alert("Error");
            }
        });
        $A.enqueueAction(action);
	}
})