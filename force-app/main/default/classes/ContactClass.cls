public with sharing class ContactClass {
    public static void calculateWeightStatus(Contact[] newList, Map<Id,Contact> oldMap) {

            for(Contact c: newList){
                if(oldMap != null &&c.Body_Mass_Index__c != oldMap.get(c.Id).Body_Mass_Index__c && c.Body_Mass_Index__c != null || oldMap == null && c.Body_Mass_Index__c != null){
                            if(c.Body_Mass_Index__c < 18.5 ){
                                c.Weight_Status__c = 'Underweight';
                            }else if(c.Body_Mass_Index__c >= 18.5  && c.Body_Mass_Index__c <= 24.9){
                                c.Weight_Status__c = 'Normal';
                            
                            }else if(c.Body_Mass_Index__c > 25.0 && c.Body_Mass_Index__c <= 29.9){
                                c.Weight_Status__c = 'Overweight';
                            
                            }else if(c.Body_Mass_Index__c >= 30.0){
                                c.Weight_Status__c = 'Obese';
                            }
                    }
                }
            }
    }