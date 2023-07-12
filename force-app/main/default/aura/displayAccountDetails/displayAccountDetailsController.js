({
    doInit: function (component, event, helper) {
        var pageRef = component.get("v.pageReference");
        var accId = pageRef.state.c__accID
        console.log('Init acc ID: ' , pageRef.state.c__accID );
        var calledFor = pageRef.state.c__accID
        console.log('Init called for: ' , pageRef.state.c__calledfor);        
        component.set("v.accRecId", accId);
        component.set("v.showAccDetails", true);
    },

    refreshPage: function (component, event, helper) {
        $A.get('e.force:refreshView').fire();        
    },

    goBack: function (component, event, helper) {
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