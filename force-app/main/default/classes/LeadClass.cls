public with sharing class LeadClass {
    public static void leadConvertEvent(Lead[] newList) {
    List<LeadConversionEvent__e> eventsToPublish = new List<LeadConversionEvent__e>();       
    System.debug('LeadClass.leadConvertEvent');
    for (Lead l : newList) {
        if (l.Phone != null && l.Email != null && l.Weight__c != null && l.Height__c != null && l.ExternalId__c != null) {
            System.debug('eventsToPublish leadConvertEvent');
            LeadConversionEvent__e conversionEvent = new LeadConversionEvent__e(LeadId__c = l.Id);
            eventsToPublish.add(conversionEvent);
        }
    }

    if (!eventsToPublish.isEmpty()) {
        Database.SaveResult[] results = EventBus.publish(eventsToPublish);
    }
    }


    public static void leadConversionHandler(LeadConversionEvent__e[] events){

        List<Database.LeadConvert> leadConverts = new List<Database.LeadConvert>();
        
        for(LeadConversionEvent__e event:events){
        Lead leadToConvert = [SELECT Id, FirstName, LastName, Email, Phone, Company, ExternalId__c 
                                  FROM Lead 
                                  WHERE Id =: event.LeadId__c];
            
            if (leadToConvert != null) {
                Database.LeadConvert leadConvert = new Database.LeadConvert();
                leadConvert.setLeadId(leadToConvert.Id);
                leadConvert.setDoNotCreateOpportunity(true); 

                LeadStatus convertStatus = [SELECT Id, ApiName FROM LeadStatus WHERE IsConverted=true LIMIT 1];
				leadConvert.setConvertedStatus(convertStatus.ApiName);
                
                leadConverts.add(leadConvert);
            }
        }

        if (!leadConverts.isEmpty()) {
            Database.LeadConvertResult[] results = Database.convertLead(leadConverts);
            for(Database.LeadConvertResult result : results) {
                if (result.isSuccess()) {
                System.debug('Conversion was successful');
                } else {
                    System.debug('Conversion failed:');
                    for(Database.Error error : result.getErrors()) {
                        System.debug(error.getStatusCode() + ': ' + error.getMessage());
                    }
                }   
            }
        }   
    }
    
}