import { LightningElement } from 'lwc';
import Account_Name from '@salesforce/schema/Account.Name';
import Account_Type from '@salesforce/schema/Account.Type';
import Account_Industry from '@salesforce/schema/Account.Industry';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {NavigationMixin} from 'lightning/navigation';
export default class AccountCreate extends NavigationMixin(LightningElement) {

    objectApiName = 'Account';
    fieldList = [Account_Name,Account_Type,Account_Industry];

    handleSuccess(event){

        const evt = new ShowToastEvent({

            title:'Account Create',
            message:'Account Created : '+event.detail.id,
            variant:'success'
        });

        this.dispatchEvent(evt);

        this[NavigationMixin.Navigate]({
            type:'standard__recordPage',
            attributes:{
                recordId:event.detail.id,
                objectApiName:'Account',
                actionName:'view'
            }

        });
    }
}