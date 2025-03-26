import { LightningElement,track } from 'lwc';

export default class ShapeCalculator extends LightningElement {
  @track currentOutput;
  width;
  height;
  side;
  diagonal1;
  diagonal2;

  sideChangeHandler(event){
    this.side = event.target.value;
  }

  widthChangeHandler(event){
    this.width = event.target.value;
  }

  heightChangeHandler(event){
    this.height = event.target.value;
  }

  diagonal1ChangeHandler(event){
    this.diagonal1 = event.target.value;
  }

  diagonal2ChangeHandler(event){
    this.diagonal2 = event.target.value;
  }

  calculateSquareAreaHandle(){
    const s = parseInt(this.side);
    console.log(this.side);
    this.currentOutput = 'Area of square is '+ (s*s);
  }

  calculateRectangleAreaHandle(){
    const p = parseInt(this.height);
    const l = parseInt(this.width);
    this.currentOutput = 'Area of rectangle is '+ (p*l);
  }

  calculateRhombusAreaHandle(){
    const d1 = parseInt(this.diagonal1);
    const d2 = parseInt(this.diagonal2);
    this.currentOutput = 'Area of rhombus is '+ (d1*d2)/2;
  }


}