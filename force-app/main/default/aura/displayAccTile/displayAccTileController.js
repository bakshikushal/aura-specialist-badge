({

    init: function (cmp, event, helper) {
        var navService = cmp.find("navService");
        var accrecord = cmp.get("v.accRecord");
        var accId = accrecord.Id;
        // Sets the route to /lightning/o/Account/home
        var pageReference = {
            type: 'standard__recordPage',
            attributes: {
                objectApiName: 'Account',
                recordId: accId,
                "actionName": "view"
            }
        };
        cmp.set("v.pageReference", pageReference);
        // Set the URL on the link or use the default if there's an error
        var defaultUrl = "#";
        navService.generateUrl(pageReference)
            .then($A.getCallback(function (url) {
                cmp.set("v.url", url ? url : defaultUrl);
            }), $A.getCallback(function (error) {
                cmp.set("v.url", defaultUrl);
            }));
    },

    viewAccDetails: function (component, event, helper) {
        var btn = component.find('accountbtnId');
        var accId = btn.get('v.name');
        var nav = component.find('navService');
        if (accId) {
            var pageReference = {
                type: 'standard__component',
                attributes: {
                    componentName: 'c__displayAccountDetails',
                },
                state: {
                    "c__accID": accId,
                    "c__calledfor": "View"
                }
            };
            nav.navigate(pageReference);
        } else {
            alert('No Account Id Passed To View Details');
        }
    },

    showContactModal: function (component, event, helper) {
        var modalBody;
        var accID = component.find('conModalId').get('v.name');
        //console.log('Showing related contacts for account:', accID);
        $A.createComponent('c:displayContactRecords', {
            accountId: accID
        }, function (com, status) {
            //console.log('Component created with state:', status);
            if (status === 'SUCCESS') {
                modalBody = com;
                var overLib = component.find('overLib');
                overLib.showCustomModal({
                    header: "Related Contact Records",
                    body: modalBody,
                    showCloseButton: true
                })
            }
        })
    },

    viewConDetailsModal: function (component, event, helper) {
        component.set("v.showModal", true);
        var accountID = component.find('conbtnId').get('v.name');
        component.set("v.accId", accountID);
    },
    
    closeModal: function (component, event, helper) {
        component.set("v.showModal", false);
    },

    addContacts: function (component, event, helper) {
        component.set("v.showModal", false);
        var accid = component.find('addContactsbtnId').get('v.name');
        var nav = component.find('navService');
        var pageReference = {
            type: 'standard__component',
            attributes: {
                componentName: 'c__addOrViewContact',
            },
            state: {
                "c__accID": accid,
                "c__calledfor": "Add"
            }
        };
        nav.navigate(pageReference);
    }


})