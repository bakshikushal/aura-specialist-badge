({
	saveAccount : function(component, event, helper) {
        component.find('recordDataId').saveRecord($A.getCallback(function(saveRecordResult){
            console.log('Response from Edit:' + saveRecordResult.state + saveRecordResult.error )
            var errMsg = "";
            if(saveRecordResult.state == 'SUCCESS'){
                console.log('Record Updated');
            }
            else if (saveRecordResult.state === "ERROR") {
				for (var i = 0; i < saveRecordResult.error.length; i++) {
                    errMsg += saveRecordResult.error[i].message + "\n";
                }
                component.set("v.recordSaveError", errMsg);
            }
        }));
		
	},
    handleRecordUpdated: function(component, event, helper) {
        var eventParams = event.getParams();
        if(eventParams.changeType === "CHANGED") {
            // get the fields that are changed for this record
            var changedFields = eventParams.changedFields;
            console.log('Fields that are changed: ' + JSON.stringify(changedFields));
            // record is changed so refresh the component (or other component logic)
            var resultsToast = $A.get("e.force:showToast");
            resultsToast.setParams({
                "title": "Saved",
                "message": "The record was updated."
            });
            resultsToast.fire();
        } else if(eventParams.changeType === "LOADED") {
            // record is loaded in the cache
        } else if(eventParams.changeType === "REMOVED") {
            // record is deleted and removed from the cache
        } else if(eventParams.changeType === "ERROR") {
            console.log('Error: ' + component.get("v.error"));
        }
    }
})