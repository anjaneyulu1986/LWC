import { LightningElement,api } from 'lwc';
import Contact_FirstName from '@salesforce/schema/Contact.FirstName';
import Contact_LastName from '@salesforce/schema/Contact.LastName';
import Contact_Email from '@salesforce/schema/Contact.Email';
import contact_Account from '@salesforce/schema/Contact.AccountId';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class ContactQuickUpdate extends LightningElement {

    @api recordId;
    @api objectApiName;

    fieldList = [Contact_FirstName,Contact_LastName,Contact_Email,contact_Account];
    handleSuccess(event){
        
    /*    const evt = new ShowToastEvent({

            title:'Contact Update',
            message:'Contact  is updated',
            variant:'success'
        });
        this.dispatchEvent(evt);*/

        const evt = new ShowToastEvent({

            title:'Contact Update',
            message:'Contact Updated : ',
            variant:'success'
        });

        this.dispatchEvent(evt);
    }

}