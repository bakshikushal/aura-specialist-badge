({
	openOrCloseRegistrationForm: function(cmp, evnt, hlpr) {	
       	console.log("openRegistrationForm called");
        var a = evnt.getSource().get("v.label");
        console.log("var a is " +a);
        
        if (a == "Open Registration form"){
            cmp.set("v.openRegistrationform", true);
            cmp.set("v.ButtonLabel", "Close the Form");
        }
        if (a == "Close the Form"){
            cmp.set("v.openRegistrationform", false);
            cmp.set("v.ButtonLabel", "Open Registration form");
        }
        
	}
})