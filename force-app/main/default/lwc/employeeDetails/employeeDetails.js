import { LightningElement,api } from 'lwc';

export default class EmployeeDetails extends LightningElement {
  @api empDetails = [
    {empName: 'Steve', empAddress: 'SV'},
    {empName: 'John', empAddress: 'TX'},
    {empName: 'Hans', empAddress: 'CA'},
    {empName: 'Darick', empAddress: 'AZ'},
    {empName: 'Bella', empAddress: 'OT'},
    {empName: 'Jeanie', empAddress: 'SX'},
    {empName: 'Smith', empAddress: 'NC'}
  ];
}