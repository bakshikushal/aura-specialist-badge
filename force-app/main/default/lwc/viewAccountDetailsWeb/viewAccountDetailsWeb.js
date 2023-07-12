import { LightningElement, wire, api } from 'lwc';
import {CurrentPageReference, NavigationMixin} from 'lightning/navigation'
import {getRecord} from 'lightning/uiRecordApi'
import NAME_FIELD from '@salesforce/schema/Account.Name'
import PHONE_FIELD from '@salesforce/schema/Account.Phone'
import IND_FIELD from '@salesforce/schema/Account.Industry'
import RATING_FIELD from '@salesforce/schema/Account.Rating'
export default class ViewAccountDetailsWeb extends NavigationMixin(LightningElement){
    
    @api accountId;
    accId;
    accName;
    accPhone;
    accIndustry;
    accRating; 
    pageRef;
    formMode = 'readonly';
    hideEdit = false;
    
    goBack(){
        this.pageRef = {
            type : 'standard__navItemPage',
            attributes : {
                apiName : 'LWC_Accounts_Demo'
            }
        };
        this[NavigationMixin.Navigate](this.pageRef);
    }

    changeMode(event){
        this.hideEdit === false ? this.hideEdit = true : this.hideEdit = false ;
        this.formMode === 'readonly' ? this.formMode = 'edit' : this.formMode = 'readonly' ;         
    }

    @wire(getRecord,{ recordId : '$accountId', fields: [NAME_FIELD, PHONE_FIELD, IND_FIELD, RATING_FIELD]})
    accRecord({data, error}){
        if(data){            
            this.accName = data.fields.Name.value;
            this.accPhone = data.fields.Phone.value;
            this.accIndustry = data.fields.Industry.value;
            this.accRating = data.fields.Rating.value;
        }
    }

    /* We are not using pagereference here
    @wire (CurrentPageReference)
    getStateVar(pageRef){
        this.accId = pageRef.state.c__accountId;
        console.log(`State Variables Passed: ${pageRef.state}`);
    }
    */
}