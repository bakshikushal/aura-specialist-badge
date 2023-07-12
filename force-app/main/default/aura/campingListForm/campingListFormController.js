({
	clickCreateItem : function(component, event, helper) {
        let isValid = component.find('CampingForm').reduce(function(isValid, cmp){
            cmp.showHelpMessageIfInvalid();
            return isValid && cmp.get('v.validity').valid;
        },true);
        
        if(isValid){
            let item = component.get('v.newItem');
            helper.createItem(component, event, item);
		}
        
	}
    
})