import { LightningElement,track } from 'lwc';

export default class Greeting extends LightningElement {
  @track Name = '';

  changeHandler(event){
    this.Name = event.target.value;
  }
}