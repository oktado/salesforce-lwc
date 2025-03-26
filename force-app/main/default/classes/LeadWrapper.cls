public with sharing class LeadWrapper {
    public class createLeadRequestModel{
        public String FirstName {get;set;}
        public String LastName {get;set;}
        public String Phone {get;set;}
        public String Email {get;set;}
        public String Street {get;set;}
        public String City {get;set;}
        public String State {get;set;}
        public String Country {get;set;}
        public String PostalCode {get;set;}
        public Decimal Weight {get;set;}
        public Decimal Height {get;set;}
        public String ExternalId {get;set;}
        public String Company {get;set;}
    }
    public class createLeadResponseModel{
        public String responseCode {get;set;}
        public String responseMessage {get;set;} 
    }
}