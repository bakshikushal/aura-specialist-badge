({
    showModal: function (component, event, helper) {
        var oLib = component.get('overlayLib');
        oLib.showCustomModal({
            header: "Contact Details",
            body: "Account Id for the contact:"+ "{!v.accountId}" ,
            showCloseButton: true,
            closeCallback: function () {
                alert('You closed the alert!');
            }
        })
    }
})