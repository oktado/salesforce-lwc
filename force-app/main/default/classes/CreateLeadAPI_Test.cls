
@isTest
public with sharing class CreateLeadAPI_Test {
    @isTest
    static void testCreateLeadAPI() {
        Test.startTest();
        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        req.remoteAddress = '192.178.100.20';
        req.requestURI = '/services/apexrest/createLeads'; 
        req.httpMethod = 'POST';
        req.addHeader('Content-Type', 'application/json');
        LeadWrapper.createLeadRequestModel rrm = LeadAPIWrapper_Test.createLeadRequestModel();
        string testbody = json.serialize(rrm);
        req.requestBody = Blob.valueOf(testbody);
        RestContext.request = req;
        RestContext.response = res;
        CreateLeadAPI.createLeads();
        Test.stopTest();
    }

    @isTest
    static void testCreateLeadAPIFalse() {
        Test.startTest();
        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        req.remoteAddress = '192.178.100.20';
        req.requestURI = '/services/apexrest/createLeads'; 
        req.httpMethod = 'POST';
        req.addHeader('Content-Type', 'application/json');
        LeadWrapper.createLeadRequestModel rrm = LeadAPIWrapper_Test.createLeadRequestModelFalse();
        string testbody = json.serialize(rrm);
        req.requestBody = Blob.valueOf(testbody);
        RestContext.request = req;
        RestContext.response = res;
        CreateLeadAPI.createLeads();
        Test.stopTest();
    }
    @isTest
    static void testCreateLeadAPIError() {
        Test.startTest();
        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        req.remoteAddress = '192.178.100.20';
        req.requestURI = '/services/apexrest/createLeads'; 
        req.httpMethod = 'POST';
        req.addHeader('Content-Type', 'application/json');
        req.requestBody = Blob.valueOf('');
        RestContext.request = req;
        RestContext.response = res;
        CreateLeadAPI.createLeads();
        Test.stopTest();
    }
}