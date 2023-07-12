({
    showAcc : function(component, event, helper) {
        component.set('v.showAcc', true);
    },
  
    hideAcc : function(component, event, helper) {
        component.set('v.showAcc', false);
    },
  
    doInit : function(component, event, helper) {
        var action = component.get("c.getAccList");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var results = response.getReturnValue();
                component.set("v.accList", results);
            }
        })
        $A.enqueueAction(action);
    },

    handleViewContactEvent : function(component, event, helper) {
        var accID = event.getParam('accountId');
        component.set('v.accId', accID);
        //console.log('Event Handled in Parent & Account ID:', accID)
    }
})