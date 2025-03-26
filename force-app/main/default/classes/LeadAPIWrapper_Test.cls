@isTest
public with sharing class LeadAPIWrapper_Test {
    
    public static LeadWrapper.createLeadRequestModel createLeadRequestModel(){
        LeadWrapper.createLeadRequestModel req = new LeadWrapper.createLeadRequestModel();
        req.FirstName = 'Test';
        req.LastName = 'Name';
        req.Phone = '345346636';
        req.Email = 'test@mail.co';
        req.Street = 'st 123';
        req.City = 'Jakarta';
        req.State = 'Jakarta';
        req.Country = 'Indonesia';
        req.PostalCode = '100012';
        req.Weight = 80.5;     
        req.Height = 1.65;
        req.ExternalId = 'aasdas234234';
        req.Company = 'Test Company';
        return req;
    }

    public static LeadWrapper.createLeadRequestModel createLeadRequestModelFalse(){
        LeadWrapper.createLeadRequestModel req = new LeadWrapper.createLeadRequestModel();
        req.FirstName = 'Test';
        req.LastName = 'Name';
        return req;
    }

    public static LeadWrapper.createLeadResponseModel createLeadResponseModel(){
        LeadWrapper.createLeadResponseModel res = new LeadWrapper.createLeadResponseModel();
        res.responseCode = '200';
        res.responseMessage = 'Success create lead';
        return res;
    }

}