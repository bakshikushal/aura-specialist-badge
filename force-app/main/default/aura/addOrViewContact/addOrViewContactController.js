({
    doInit : function(component, event, helper) {
        //alert('We are in add or view after changing');
        var pageRef = component.get("v.pageReference");
        var accId = pageRef.state.c__accID
        console.log('Init acc ID: ' , pageRef.state.c__accID );
        var calledFor = pageRef.state.c__accID
        console.log('Init called for: ' , pageRef.state.c__calledfor);        
        component.set("v.accountId", accId);
    },
    
    doChange:function(component, event, helper) {
        $A.get('e.force:refreshView').fire();        
    },

    handleSuccess: function(component, event, helper) {
        component.set("v.accountId", " ");
        var toast = $A.get("e.force:showToast");
        toast.setParams({
            title : "Success",
            message : "Record Successfully Created!!",
            type : "success"
        });
        toast.fire();
        var navService = component.find('navService');
        var pagref = {
            type: 'standard__component',
            attributes: {
                componentName: 'c__accountsListAuraComp',
            }            
        };
        navService.navigate(pagref);
    },
    handleCancel: function(component, event, helper){
        var toast = $A.get("e.force:showToast");
        toast.setParams({
            title : "Cancelled",
            message : "Contact Creation Cancelled!!",
            type : "warning"
        });
        toast.fire();
        var navService = component.find('navService');
        var pagref = {
            type: 'standard__component',
            attributes: {
                componentName: 'c__accountsListAuraComp',
            }            
        };
        navService.navigate(pagref);
    }
})