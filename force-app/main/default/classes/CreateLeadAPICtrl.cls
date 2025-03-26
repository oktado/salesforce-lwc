public with sharing class CreateLeadAPICtrl {

    Public Static LeadWrapper.createLeadResponseModel createLead(LeadWrapper.createLeadRequestModel jreq){
        Map<String, Response__mdt> maprc = Response__mdt.getAll();
        LeadWrapper.createLeadResponseModel jres = new LeadWrapper.createLeadResponseModel();

        Lead ld = new Lead();
        ld.FirstName = jreq.FirstName;
        ld.LastName = jreq.LastName;
        ld.Phone = jreq.Phone;
        ld.Email = jreq.Email;
        ld.Street__c = jreq.Street;
        ld.City__c = jreq.City;
        ld.State__c = jreq.State;
        ld.Country__c = jreq.Country;
        ld.PostalCode__c = jreq.PostalCode;
        ld.Weight__c = jreq.Weight;
        ld.Height__c = jreq.Height;
        ld.ExternalId__c = jreq.ExternalId;
        ld.Company = jreq.Company;

        Database.SaveResult sr = Database.insert(ld);
        system.debug('sr:'+sr);
        if(sr.isSuccess()){
            jres.responseCode = maprc.get('Success').Response_Code__c;
            jres.responseMessage = maprc.get('Success').Description__c;
        }else{
            String errmsg = '';
            String errcode = '';
            for(Database.Error err : sr.getErrors()) {
                errmsg += err.getMessage() + ' ';
                errcode = String.valueOf(err.getStatusCode());
            }
            jres.responseCode = errcode;
            jres.responseMessage = errmsg;
        }

        return jres;
    }


    Public Static String returnAPI(LeadWrapper.createLeadResponseModel jres){
        String return_json = '';
        return_json = (String) JSON.serialize(jres,false);
        return_json = return_json.normalizeSpace().trim(); 
        return return_json;
    }
}