public with sharing class CalculatorBMI_Ctrl {
    @AuraEnabled
    public static List<Contact> getContacts(Id recordId) {
        System.debug('getContacts :'+recordId);
       return [SELECT Id,Name, FirstName, LastName,Age__c,BMI__c,Weight_Status__c, Email,Weight__c,Height__c,Phone FROM Contact WHERE Id =:recordId];
    }
}