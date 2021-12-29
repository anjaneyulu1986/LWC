import { LightningElement,api } from 'lwc';

export default class LoadCmp extends LightningElement {

    @api
    objectApiName = 'Account';

   
    fields = [ 'Name', 'Industry', 'Phone', 'Email'];

    @api
    recordId;
}