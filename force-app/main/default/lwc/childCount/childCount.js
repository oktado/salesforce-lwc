import { LightningElement } from 'lwc';

export default class ChildCount extends LightningElement {
  endValue = 5;
  msg="End Value Stop";
  handleAdd(){
    console.log('add');
    this.dispatchEvent(new CustomEvent("add"),{detail:{endValue:this.endValue,msg:this.msg}});
  }
  handleMinus(){
    console.log('minus');
    this.dispatchEvent(new CustomEvent("minus"));
  }
}