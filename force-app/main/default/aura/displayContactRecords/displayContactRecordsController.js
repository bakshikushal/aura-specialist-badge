({
    getContacts: function (component, event, helper) {
        component.set("v.showSpinner", true);
        component.set("v.conList", "");
        var accIDpassed = component.get("v.accountId");
        if (accIDpassed) {
            var action = component.get("c.getContactsForAccId");
            action.setParams({
                accId: accIDpassed
            })
            action.setCallback(this, function (response) {
                var contacts = response.getReturnValue();
                component.set("v.showSpinner", false);
                if (contacts.length > 0) {
                    component.set("v.showConList", true);
                    component.set("v.conList", contacts);
                } else {
                    component.set("v.showConList", false);
                    component.set("v.conList", "");
                }

            })
            $A.enqueueAction(action);
        } else
            console.log("No Acc ID Passed :", accIDpassed);

    },


    delContacts: function (component, event, helper) {
        var selectedList = component.find('conToDelete');
        var deleteList = [];        
        if (selectedList.length === undefined) {
            console.log('Single Item:' + selectedList.get('v.checked'));
            if (selectedList.get('v.checked'))
                deleteList.push(selectedList.get('v.value'));
        }
        if (selectedList.length > 0) {
            for (var i = 0; i < selectedList.length; i++) {
                if (selectedList[i].get('v.checked')) {
                    console.log('flag checked? ' + selectedList[i].get('v.value'))
                    deleteList.push(selectedList[i].get('v.value'));
                }
            }
        }
        if (deleteList.length > 0) {
            console.log('You selected ' + deleteList.length + ' Contacts to delete');
            var action = component.get('c.deleteContacts');
            action.setParams({
                conIds: deleteList
            });
            action.setCallback(this, function (response) {
                var state = response.getState();
                console.log('State: ' + state);
                var msg = response.getReturnValue();
                console.log('Message from Server:', msg);
                if (state === "SUCCESS" && msg === 'Success Deleted') {
                    var toast = $A.get("e.force:showToast");
                    toast.setParams({
                        title: "Success",
                        message: "Contacts Successfully Deleted!!",
                        type: "success"
                    });
                    toast.fire();
                    $A.get("e.force:refreshView").fire();
                } else {
                    var toast = $A.get("e.force:showToast");
                    toast.setParams({
                        title: "Error Deleting Contacts",
                        message: 'There was some Error Deleting Contacts!!',
                        type: "error"
                    });
                    toast.fire();
                    $A.get("e.force:refreshView").fire();
                }
            });
            $A.enqueueAction(action);
        } else {
            console.log('You selected ' + deleteList.length + ' Contacts to delete');
            var toast = $A.get("e.force:showToast");
            toast.setParams({
                title: "Warning",
                message: "No contacts Selected For Deletion",
                type: "warning"
            });
            toast.fire();
        }
    }


})