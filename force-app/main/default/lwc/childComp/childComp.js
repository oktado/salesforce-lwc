import { LightningElement,api,track } from 'lwc';

export default class ChildComp extends LightningElement {
 @track Message;
 
   @api
   getMessage(string){
     this.Message = string.toUpperCase();
   }
}