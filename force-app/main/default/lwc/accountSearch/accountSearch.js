import { LightningElement,wire } from 'lwc';
import queryAccountsByEmployeeNumber from '@salesforce/apex/AccountListControllerLwc.queryAccountsByEmployeeNumber';

export default class AccountSearch extends LightningElement {
    numberOfEmployees;

    handleChange(event) {
        this.numberOfEmployees = event.detail.value;
    }
    reset() {
        this.numberOfEmployees = null;
    }

    
    @wire(queryAccountsByEmployeeNumber, { numberOfEmployees: '$numberOfEmployees' })
    accounts;
}