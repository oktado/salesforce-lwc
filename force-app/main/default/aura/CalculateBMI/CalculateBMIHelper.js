({
    fetchAccount: function(component,type) {
        var action = component.get("c.getInstance");
    
        var currentPage = component.get("v.pageNumber");
        var pageSize = component.get("v.pageSize");
    
        console.log("pageNumber " + currentPage);
    
        action.setParams({
            "pageNumber": currentPage,
            "pageSize": pageSize,
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.debug('state',state);
            console.debug('response',response.getReturnValue());
            if (state === "SUCCESS") {
                var result = response.getReturnValue();

                result.caseList.forEach(function(caseItem) {
                    caseItem.CreatedDate = new Date(caseItem.CreatedDate).toISOString().split('T')[0];
                });
    
                component.set("v.cases", result.caseList);
                component.set("v.totalRecords", result.totalRecords);
                component.set("v.totalPages", result.totalPages);
                component.set("v.permissionNFT",result.permissionNFT);
                
                if(type == 'init'){
                    component.find("allCaseCheckbox").set("v.checked", true);
                    component.set("v.allCaseIds", result.allCaseIds);
                    component.set("v.selectedCaseIds", result.allCaseIds);
                    
                    console.log('tes selectedCaseIds');
                    console.log(result.allCaseIds);
                    var caseCheckboxes = component.find("caseCheckbox");
                    if(caseCheckboxes != null){
                        if (Array.isArray(caseCheckboxes)) {
                            caseCheckboxes.forEach(function(checkbox) {
                                checkbox.set("v.checked", true);
                            });
                        } else {
                            caseCheckboxes.set("v.checked", true);
                        }
                    }
                }else{
                    var selectedCaseIds = component.get("v.selectedCaseIds");
                    var caseCheckboxes = component.find("caseCheckbox");
                    if(caseCheckboxes != null){
                        if (Array.isArray(caseCheckboxes)) {
                            caseCheckboxes.forEach(function(checkbox) {
                                if(selectedCaseIds.includes(checkbox.get("v.value"))){
                                    checkbox.set("v.checked", true);
                                }else{
                                    checkbox.set("v.checked", false);
                                }
                            });
                        } else if (selectedCaseIds.includes(caseCheckboxes.get("v.value"))) {
                            caseCheckboxes.set("v.checked", true);
                        } else if (!selectedCaseIds.includes(caseCheckboxes.get("v.value"))) {
                            caseCheckboxes.set("v.checked", false);
                        }
                    }
                }
            } else {
                console.error(response.getError());
            }
        });
        $A.enqueueAction(action);
    }
})