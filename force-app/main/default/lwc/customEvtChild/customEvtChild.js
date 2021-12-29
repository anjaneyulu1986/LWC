import { LightningElement,api } from 'lwc';

export default class CustomEvtChild extends LightningElement {

    @api
    message = '';

    handleMessageChange(event){
        this.message = event.target.value;
        this.dispatchEvent(new CustomEvent('message',{detail:this.message}));
    }
}