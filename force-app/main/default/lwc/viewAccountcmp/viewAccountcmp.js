import { LightningElement,api } from 'lwc';

export default class ViewAccountcmp extends LightningElement {

    @api
    objectApiName;

    fields = ['Name','Phone','Industry','Type'];

    @api
    recordId;
}