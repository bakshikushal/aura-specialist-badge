({
	createItem : function(component, item) {
		let action = component.get('c.saveItem');
        action.setParams({'item': item});
        action.setCallback(this,function(response){
		console.log('UPDATING Response->' + response.getState() + ' --> ' +response.getReturnValue() );
            if(response.getState() == 'SUCCESS'){
                let itemList = component.get('v.items');
            	itemList.push(response.getReturnValue());
				component.set('v.items', itemList);
            }
        });
        $A.enqueueAction(action);
	}
})