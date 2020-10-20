({
    clone : function(cmp, evt, helper) {
        let action = cmp.get("c.clone");
        action.setParams({  targetId: cmp.get('v.recordId') })

        action.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS") {
                $A.get("e.force:closeQuickAction").fire()
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    title: "Success!",
                    message: "Record has been cloned.",
                    type: "success"
                });
                toastEvent.fire();
            } else {
                console.log('state', state)
            }
        });
        $A.enqueueAction(action);
    }
})
