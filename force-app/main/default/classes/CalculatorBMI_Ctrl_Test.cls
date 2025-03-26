@isTest
public with sharing class CalculatorBMI_Ctrl_Test {

    @isTest
    public static void convertLeadTest1() {
        Lead l = new Lead();
        l.FirstName = 'Test';
        l.LastName = 'Name';
        l.Company = 'ABC Company';
        l.Weight__c = 87.5;
        l.Height__c = 1.85;
        l.ExternalId__c = '324234twwerrw';

        insert l;

        Contact c = new Contact();
        c.FirstName = 'Test';
        c.LastName = 'Name';
        c.Weight__c = 87.5;
        c.Height__c = 1.85;
        c.ExternalId__c = '324234twwerrw';

        insert c;


    
        CalculatorBMI_Ctrl.getContacts(c.Id);
        
    }


    @isTest
    public static void convertLeadTest2() {
        Lead l = new Lead();
        l.FirstName = 'Test1';
        l.LastName = 'Name';
        l.Company = 'ABC Company';
        l.Weight__c = 71.5;
        l.Height__c = 1.85;
        l.ExternalId__c = '324234twwerrw';

        insert l;

        Contact c = new Contact();
        c.FirstName = 'Test';
        c.LastName = 'Name';
        c.Weight__c = 71.5;
        c.Height__c = 1.85;
        c.ExternalId__c = '324234twwerrw';

        insert c;


    
        CalculatorBMI_Ctrl.getContacts(c.Id);
        
    }

    @isTest
    public static void convertLeadTest3() {
        Lead l = new Lead();
        l.FirstName = 'Test1';
        l.LastName = 'Name';
        l.Company = 'ABC Company';
        l.Weight__c = 51.5;
        l.Height__c = 1.85;
        l.ExternalId__c = '324234twwerrw';

        insert l;

        Contact c = new Contact();
        c.FirstName = 'Test';
        c.LastName = 'Name';
        c.Weight__c = 51.5;
        c.Height__c = 1.85;
        c.ExternalId__c = '324234twwerrw';

        insert c;


    
        CalculatorBMI_Ctrl.getContacts(c.Id);
        
    }
}