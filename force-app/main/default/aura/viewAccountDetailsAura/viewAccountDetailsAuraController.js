({
    doInit : function(component, event, helper) {
        var pageRef = component.get('v.pageReference');
        var accId = pageRef.state.c__accountId;
        component.set("v.accountId", accId);
        console.log('Init Called For ID:', accId);
    },
    doRefresh: function(component, event, helper) {
        $A.get('e.force:refreshView').fire();
    }
})