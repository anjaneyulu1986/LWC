import { LightningElement,track, wire } from 'lwc';
import accountName from '@salesforce/schema/Account.Name';
import accountType from '@salesforce/schema/Account.Type';
import accountPhone from '@salesforce/schema/Account.Phone';
import AccountObject from '@salesforce/schema/Account';
import {NavigationMixin} from 'lightning/navigation';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import createAccount from '@salesforce/apex/AccountCreateController.createAccount';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';


export default class AccountCreateApex extends LightningElement {

    
    @track account = {
        Name:accountName,
        Type:accountType,
        Phone:accountPhone
    }

    @track typeValues;

    @wire(getPicklistValues,{

        objectApiName:'Account',
        fieldApiName:accountType
    })typeValues;

    @track accountId;
    handleNameChange(event){
        this.account.Name = event.target.value;
    }
    handleTypeChange(event){
        this.account.Type = event.target.value;
    }
    handlePhoneChange(event){
        this.account.Phone = event.target.value;
    }

    handleCreateAccount(){

        createAccount({acc:this.account})
        .then(result=>{
            this.accountId = result.id;
        this.dispatchEvent( new ShowToastEvent({

            title:'Success!',
            message:'Account created successfully.',
            variant:'success'
            }));

            this[NavigationMixin.Navigate]({

                type:'standard__recordPage',
                attributes:{
                    recordId:this.accountId,
                    objectApiName:'Account',
                    actionName:'view'
                }
            });

        }).catch(error =>{

            this.dispatchEvent( new ShowToastEvent({

                title:'Error!',
                message:'Account creation failed.',
                variant:'error'
                }));
        });
    }
}