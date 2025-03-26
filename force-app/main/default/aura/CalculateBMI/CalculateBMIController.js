({
    init : function(component) {
        component.set("v.Columns", [
            {label:"Name", fieldName:"Name", type:"text"},
            {label:"Age", fieldName:"Age__c", type:"text"},
            {label:"Height", fieldName:"Height__c", type:"text"},
            {label:"Weight", fieldName:"Weight__c", type:"text"},
            {label:"BMI", fieldName:"Body_Mass_Index__c", type:"text"},
            {label:"Weight Status", fieldName:"Weight_Status__c", type:"text"},
        ]);
        
        console.log("recordId :"+component.get("v.recordId"));

        var action = component.get("c.getContacts");
        action.setParams({
            recordId: component.get("v.recordId")
        });
        action.setCallback(this, function(data) {
            component.set("v.Contacts", data.getReturnValue());
        });
        $A.enqueueAction(action); 
    }
})