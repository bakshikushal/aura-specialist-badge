({
    btnclick : function(component, event, helper) {
        var accid = event.target.value;
        alert('Do you want to chat with: '+ accid);
        console.log(event.target);
        console.log(event.target.value);

        var acvalue = component.find('btn').get('v.value');
        alert('Lets talk to: '+ acvalue);
    }
})