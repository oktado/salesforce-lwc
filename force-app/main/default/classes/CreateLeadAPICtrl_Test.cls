@istest
public with sharing class CreateLeadAPICtrl_Test {
    
    @IsTest
    static void CreateLead() {
        Test.startTest();
        LeadWrapper.createLeadRequestModel req = LeadAPIWrapper_Test.createLeadRequestModel();
        CreateLeadAPICtrl.createLead(req);

        LeadWrapper.createLeadResponseModel res = LeadAPIWrapper_Test.createLeadResponseModel();
        CreateLeadAPICtrl.returnAPI(res);
        Test.stopTest();
    }
}