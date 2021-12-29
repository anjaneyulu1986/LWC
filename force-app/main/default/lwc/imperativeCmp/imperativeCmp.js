import { LightningElement,track,api } from 'lwc';
import getAccountsList from '@salesforce/apex/DisplayAccountsController.getAccountsList';
export default class ImperativeCmp extends LightningElement {

@track accounts;
@track columns =[{label:'Name',fieldName:'Name',type:'text'},
{label:'Type',fieldName:'Type',type:'text'}];

connectedCallback(){
    getAccountsList()
    .then(result =>{
        this.accounts = result;
    }).catch(error =>{

        alert(error);

    });
}
}