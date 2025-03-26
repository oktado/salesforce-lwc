import { LightningElement,track,api } from 'lwc';

export default class ParentCount extends LightningElement {
   count = 0;
   endValue;
   msg='';

  add(event){
    this.endValue = event.detail.endValue;
    if(this.count <= this.endValue){
      this.count++;
    }
    else {

      this.msg = event.detail.msg;
    }
    console.log(this.count);
    console.log(this.endValue);

  }
  minus(){
    if(this.count>0){
      this.count--;
      this.msg = '';
      console.log(this.count);
      console.log(this.endValue);
    }
  }
}