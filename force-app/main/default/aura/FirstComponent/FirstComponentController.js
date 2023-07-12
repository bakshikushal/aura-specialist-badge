({
	doSubmit: function(cmp, evnt, hlpr) {	
        var abcInitValue = cmp.get("v.abc");
        
        if(abcInitValue == "TRUE"){
            alert("Value is True; Setting it to FALSE");
            cmp.set("v.abc", "FALSE");
        }
        else{
            alert("Value is False; ; Setting it to TRUE");
            cmp.set("v.abc", "TRUE");
        }
	},
    
    doChangeCheckbox: function(cmp, evnt, hlpr) {
        hlpr.onChangeCheckboxhelper(cmp, evnt);
        var checkboxval = cmp.find("checkboxid").get("v.checked");
         console.log("This value is from Controller   " + checkboxval);
    }
})