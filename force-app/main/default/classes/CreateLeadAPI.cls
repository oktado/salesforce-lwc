
@RestResource(urlMapping='/createLeads/*')
global with sharing class CreateLeadAPI {
    @HttpPost
    global static void createLeads() {
        String return_json = '';
        Map<String, Response__mdt> maprc = Response__mdt.getAll();
        RestRequest request_api = RestContext.request;
        RestResponse respond_api = Restcontext.response;
        LeadWrapper.createLeadResponseModel jres = new LeadWrapper.createLeadResponseModel();
        Boolean cek_data = false;
        String fm = '';
        try{
            String wrapperclassname = 'createLeadRequestModel';
            String cond = 'Wrapper_Class_Name__c=:wrapperclassname';
            String reqobj = request_api?.requestBody?.toString(); 
            Map<String, Object> mapreq = (Map<String, Object>) JSON.deserializeUntyped(reqobj);
            system.debug('mapreq :'+mapreq);
            LeadWrapper.createLeadRequestModel jreq = (LeadWrapper.createLeadRequestModel) json.deserializeStrict(reqobj, LeadWrapper.createLeadRequestModel.class);

            String allfield = SOQL_SOBJECT.getallfield('Mandatory_Field_API__mdt');
            String queries = SOQL_SOBJECT.SOQL(allfield, '', 'Mandatory_Field_API__mdt', '', '', '', '');
            List<Mandatory_Field_API__mdt> listmf = Database.query(queries);
            for(Mandatory_Field_API__mdt md:listmf){
                String val = String.valueOf(mapreq.get(md.MasterLabel));
                if(String.isBlank(val)){
                    cek_data = true;
                    jres.responseCode = maprc?.get('Mandatory')?.Response_Code__c;
                    jres.responseMessage = maprc?.get('Mandatory')?.Description__c+' '+md.MasterLabel;
                    break;
                }
            }

            if(!cek_data){ 
                System.debug('!cek_data :'+!cek_data);

                jres = CreateLeadAPICtrl.createLead(jreq);
            }
            return_json = CreateLeadAPICtrl.returnAPI(jres);

			CreateLeadAPI.InsertErrorLog(null, request_api, respond_api,return_json);
        }
        catch(Exception exc){
            String typename = exc.getTypeName().replace('System.', '');
            jres = new LeadWrapper.createLeadResponseModel();
            jres.responseMessage = exc?.getMessage();
            if(maprc.containskey(typename)){
                jres.responseCode = maprc.get(typename).Response_Code__c;
            }
            else{
                for(Response__mdt rc:maprc.values()){
                    if(jres.responseMessage.contains(rc.MasterLabel)) {
                        jres.responseCode = rc.Response_Code__c;
                        break;
                    }
                }
            }
            if(String.isBlank(jres.responseCode)) {
                jres.responseCode = maprc?.get('General_Error')?.Response_Code__c;
            }
            return_json = CreateLeadAPICtrl.returnAPI(jres);
            CreateLeadAPI.InsertErrorLog(exc, request_api, respond_api,return_json);
        }
        Restcontext.response.addHeader('Content-Type', 'application/json');
        Restcontext.response.responseBody = Blob.valueOf(return_json);
        Restcontext.response.statuscode = 200;
        
    }

    public static void InsertErrorLog(Exception e,RestRequest request_api,RestResponse respond_api,String return_json){
        Error_Log__c el = new Error_Log__c();
        el.Error_Messages__c = e?.getMessage();
        el.Stack_Trace__c = e?.getStackTraceString();
        el.Type_Name__c = e?.getTypeName();
        el.Line_Number__c = string.valueOf(e?.getLineNumber()); 
        el.Error_Cause__c = string.valueOf(e?.getCause()); 
        el.Class_Flow_Name__c = 'CreateLeadAPI';
        el.request_header__c = String.valueof(request_api?.headers);
        el.request_body__c = String.valueOf(request_api?.requestBody);
        el.Response_Status_Code__c = String.valueOf(respond_api?.statusCode); 
        el.Response_Body__c = return_json; 
        el.Endpoint_Long__c = '/createLeads/'; 
        el.API_Type__c = 'Inbound';
        el.user_run__c = UserInfo.getUserId();

        insert el;
    }
}