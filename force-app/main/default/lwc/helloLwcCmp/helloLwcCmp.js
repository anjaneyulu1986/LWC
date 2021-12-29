import { LightningElement, track } from 'lwc';
import DISPLAYTEXT from '@salesforce/label/c.Display_Text';

export default class HelloLwcCmp extends LightningElement {

   
    @track
    disText = DISPLAYTEXT;

    @track
    message = '';
    num1 = 0;
 
    num2 = 0;
    @track
    result = 0;

    handleNum1Change(event){
             this.num1 = event.target.value;
    }
    handleNum2Change(event){

        this.num2 = event.target.value;
        console.log('num2 :: '+this.num2)
    }
    addNumbers(event){
        this.result = parseInt(this.num1) + parseInt(this.num2);
    }

    handleMssageEvent(event){

        console.log(event.detail);
        this.message = event.detail;
    }
}