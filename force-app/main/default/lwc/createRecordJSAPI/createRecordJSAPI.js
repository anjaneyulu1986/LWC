import { LightningElement,api,track } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {NavigationMixin} from 'lightning/navigation';
import {createRecord} from 'lightning/uiRecordApi';
import AccountId from '@salesforce/schema/Case.AccountId';

export default class CreateRecordJSAPI extends NavigationMixin(LightningElement) {

   @track name;
    @track phone;
    @track industry;

    handleChange(event){
       
        if(event.target.label == 'name'){
            this.name = event.target.value;
        }
        if(event.target.label == 'phone'){
            this.phone = event.target.value;
        }
        if(event.target.label == 'industry'){
            this.industry = event.target.value;
        }
    }

    createAccountRecord(){

        console.log('Account creation...'+this.name+': '+this.phone+' : '+this.industry);
       
        var fields = {'Name':this.name,'Phone':this.phone,'Industry':this.industry};
        var recordInput = {apiName:'Account',fields};

        createRecord(recordInput)
        .then(account =>{
            this.AccountId = account.id;
            console.log('record created');
            this.dispatchEvent(

                new ShowToastEvent({
                    title:'Success!!',
                    message:'Record Created',
                    variant:'success'

                }),
            );

            console.log('before navigation..'+account.id);
            this[NavigationMixin.Navigate]({
                type:'standard__recordPage',
                attributes:{
                    recordId: account.id,
                    objectApiName:'Account',
                    actionName:'view'
                }
            })

           /* this[NavigationMixin.Navigate]({
                type:'standard__recordPage',
                attribute:{
                    'recordId':account.id,
                    'objectApiName':'Account',
                    'actionName':'view'
                }
            })*/

        }).catch(error =>{

            this.dispatchEvent(

                new ShowToastEvent({
                    title:'Failure',
                    message:error.body.message,
                    variant:'error'

                })
            );
        });
    }
}