import { LightningElement } from 'lwc';

export default class ColorPicker extends LightningElement {

    handleChange(event){
        const colorCode = event.detail.value;
        const evt = new CustomEvent('colorChange',{
            detail:{colorCode}
        });
        
        this.dispatchEvent(evt);
        console.log('dispacted the event');
    }
}