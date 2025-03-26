import { LightningElement, track } from 'lwc';

export default class HelloWebComponent extends LightningElement {

  @track
  greeting = 'Ado';

  handleGreetingChange(e){
    this.greeting = e.detail.value;
  }

  currentDate = new Date().toDateString();
  get capitalizedGreeting() {
    return `Hello ${this.greeting.toUpperCase()}!`;
  }
}