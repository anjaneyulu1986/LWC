import { LightningElement,wire,track } from 'lwc';
import getAccounts from '@salesforce/apex/DisplayAccountsController.getAccounts';

export default class DisplayAccounts extends LightningElement {

    @track data;

    @wire(getAccounts) accountRecords({errors,data}){
        if(data){
            this.data = data;
        }else if(errors){
            this.data = undefined;
        }
    }
}