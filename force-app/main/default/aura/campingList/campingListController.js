({
    doInit : function(component, event, helper){
        let action = component.get("c.getItems");
        action.setCallback(this,function(response){
            console.log('Response->' + response.getState() + ' --> ' +response.getReturnValue() );
            if(response.getState() == 'SUCCESS'){
                component.set("v.items", response.getReturnValue());
            }
            else{
                console.log('Error from server while fetching records init');
            }
        });
        
        $A.enqueueAction(action);
    },
    
    handleAddItem : function(component,event,helper){
        let item = event.getParam('item');
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