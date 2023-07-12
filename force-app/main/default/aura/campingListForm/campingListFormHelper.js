({
	helperMethod : function(component, event, item) {
		let evt = component.getEvent('addItem');
        evt.setParams({'item': item});
        evt.fire();
        component.set('v.newItem',{'sobjecttype' : 'Camping_Item__c',
										'Price__c': '0',
                                         'Quantity__c': 0,
                                       'name': ''});

	}
})