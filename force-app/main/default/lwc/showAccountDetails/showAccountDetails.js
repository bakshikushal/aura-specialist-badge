import {LightningElement,wire, track} from 'lwc';
import IMG from '@salesforce/resourceUrl/ResortImage1'
import { refreshApex } from '@salesforce/apex';
import {NavigationMixin} from 'lightning/navigation'
import {deleteRecord, createRecord} from 'lightning/uiRecordApi'
import returnAccRecordsForInput from '@salesforce/apex/fetchAccRecords.returnAccRecordsForInput'
import showServerAccounts from '@salesforce/apex/getAccountsFromKushaffOrg.getAccRecordsFromKushaff'
import getContactList from '@salesforce/apex/getAccountsList.getContactsForAccId'
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';
import {getPicklistValues} from 'lightning/uiObjectInfoApi'
import OPP_OBJECT from '@salesforce/schema/Opportunity'
import OPP_ACCID_FIELD from '@salesforce/schema/Opportunity.AccountId'
import OPP_NAME_FIELD from '@salesforce/schema/Opportunity.Name'
import OPP_STAGE_FIELD from '@salesforce/schema/Opportunity.StageName'
import OPP_CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate'
import callRestService from '@salesforce/apex/GetAccRecordsRestService.getAccRecordsUsingRest'
export default class DisplayAccountDetails extends NavigationMixin(LightningElement) {

    selectedCity = '';
    selectedInd = '';
    selectedOrg = '';
    @track accRecords = [] ;
    showAccounts = false;
    resortImg = IMG;
    pageRef;
    wiredAcc;
    @track conList = [];
    errmsg;
    showConList = false;    
    singleAccId;
    showCreateOpp = false;
    oppName;
    oppCloseDate;
    oppStage;
    stageList = [];

    handleCitySelect(event) {
        this.selectedCity = event.detail;
    }
    handleIndselect(event) {
        this.selectedInd = event.detail;
    }

    handleOrgSelect(event){        
        this.selectedOrg = event.detail;
        if( this.selectedOrg === 'kushal')
        {
            this.accRecords = '';    
            console.log('Fetching Accounts From :', this.selectedOrg);
            returnAccRecordsForInput({
                inpCity: '',
                inpInd: ''
            })
            .then((results) => {
                this.accRecords = results;
                console.log('Accounts Returned From Kushal Org: ' , this.accRecords);
            })
            .catch((error) =>{
                console.log('Errors Returned : ', error);
            });
        }

        if( this.selectedOrg === 'kushaff')
        {
            this.accRecords = '';    
            showServerAccounts()
            .then((results) => {
                this.accRecords = results;
                console.log('Accounts Returned From Kushaff Org : ', this.accRecords);
            })
            .catch((error) =>{
                console.log('Errors Returned : ', error);
            });
        }

        
    }

    renderedCallback(){        
        return refreshApex(this.wiredAcc);
    }

    @wire(returnAccRecordsForInput, {
        inpCity: '$selectedCity',
        inpInd: '$selectedInd'
    })
    allAccounts(result){        
        this.wiredAcc = result;
        if(result.data){
            this.accRecords = result.data;
            if(this.accRecords.length > 0){
                this.showAccounts = true;
            }
            else{
                this.showAccounts = false;
            this.error = undefined;
            }
            
        }
        if(result.error){
            this.accRecords = undefined;
            this.error = error;
        }
    };
    get cardtitle() {
        if (this.selectedCity && this.selectedInd)
            return `Showing Accounts For ${this.selectedCity} City And ${this.selectedInd} Industry`;
        
        if (this.selectedCity)
            return `Showing Accounts For ${this.selectedCity} City `;

        if (this.selectedInd)
            return `Showing Accounts For ${this.selectedInd} Industry`;

        return "Showing All Accounts"
    }

    viewAccount(event){
        var accountId = event.target.value;
        /* This is used if you want to navigate to a Tab Page where your component is hosted
        this.pageRef = {
            type : 'standard__navItemPage',
            attributes : {
                apiName : 'View_Account_Details'
            },
            state: {
                c__accountId : accountId
            }
        };
        */
        this.pageRef = {
        type : 'standard__component',
        attributes : {
            componentName : 'c__viewAccountDetailsAura'
        },
        state: {
            c__accountId : accountId
        }
    };
        this[NavigationMixin.Navigate](this.pageRef);
    }

    viewContacts(event){        
        this.singleAccId = event.target.value;
        if(this.accRecords){
            var accIndex = this.accRecords.findIndex((ele,i) =>{                
                if(ele.Id === this.singleAccId)
                    return ele;
            })
            this.accRecord = this.accRecords[accIndex];
        }

        getContactList({accId : this.singleAccId})
        .then((results)=> {
            this.conList = results;
            this.showConList = true;            
        } )
        .catch((error) => {
            this.errmsg = error;            
        });
    }

    handleclick(event){
        console.log('Account Link clicked: event target', event.target.name);        
        var accId = event.target.name;
        this.pageRef = {
            type : 'standard__recordPage',
            attributes : {
                recordId : accId,
                objectApiName : 'Account',
                actionName: 'view'}            
        }
        this[NavigationMixin.Navigate](this.pageRef , true);
    }
    closeModal(){
        this.showConList = false;
        this.showCreateOpp = false;        
        this.oppName = '';
        this.oppStage = '';
        this.oppCloseDate = '';
    }
    delcontact(event){
        var conId = event.target.value;        
        deleteRecord(conId)
        .then(()=>{            
            var idx = this.conList.findIndex((ele,i) => {            
            if (ele.Id === conId){                
                return i;
            }
        });        
        this.conList.splice(idx,1);
        var evt = new ShowToastEvent({
            title : 'Success',
            message : 'Record Deleted Successfully',
            variant : 'success'
        });
        this.dispatchEvent(evt);
        })
        .catch((error)=>{            
            var evt = new ShowToastEvent({
                title : 'Error Deleting Record',
                message : error.body.message,
                variant : 'error'
            });
            this.dispatchEvent(evt);
        });
    }
    
    addContacts(event){
        var accId = event.target.value;
        const defaultValues = encodeDefaultFieldValues({
            AccountId: accId
        });

        this.pageRef = {
            type : 'standard__objectPage',
            attributes : {
                objectApiName : 'Contact',
                actionName: 'new'},
            state:{
                defaultFieldValues : defaultValues
            }
        }
        this[NavigationMixin.Navigate](this.pageRef , true);
        }

        handleOppName(event){
            this.oppName = event.target.value;
        }
        handleStageChange(event){
            this.oppStage = event.target.value;
        }
        handleDateChange(event){
            this.oppCloseDate = event.target.value;
        }
        
        showOpp(event){
            this.singleAccId = event.target.value;
            this.showCreateOpp = true;
        }
        
        @wire (getPicklistValues, {recordTypeId: '01236000000SKZ6AAO',  fieldApiName: OPP_STAGE_FIELD})
        oppStages({data, error}){
            if(data){                
                this.stageList = data.values;                            }
            if(error){
                console.log('Error Getting Oppo Stages : ', error);
            }
        }

        addOppRecord(event){
            const fields = {};
            fields[OPP_NAME_FIELD.fieldApiName] = this.oppName;
            fields[OPP_STAGE_FIELD.fieldApiName] = this.oppStage;
            fields[OPP_CLOSEDATE_FIELD.fieldApiName] = this.oppCloseDate;
            fields[OPP_ACCID_FIELD.fieldApiName] = event.target.value;            
            const recordInput = {apiName : OPP_OBJECT.objectApiName, fields};
            createRecord(recordInput)
            .then(opp =>{                
                this.showCreateOpp = false;
                this.dispatchEvent(new ShowToastEvent({
                    title : 'Success',
                    message : 'Opportunity created With ID:' + opp.id,
                    variant : 'success'
                }));
                this.oppName = '';
                this.oppStage = '';
                this.oppCloseDate = '';
            })
            .catch(err =>{
                this.showCreateOpp = false;
                this.dispatchEvent(new ShowToastEvent({
                    title : 'Error',
                    message : 'Error creating Opportunity',
                    variant : 'error'
                }));
                this.oppName = '';
                this.oppStage = '';
                this.oppCloseDate = '';
            });
        }

        callRestService(){
            console.log(`Calling Rest Service for ${this.selectedCity} and ${this.selectedInd}`);
            callRestService({
                city:this.selectedCity,
                ind : this.selectedInd
            })
            .then(result => {
                console.log('Account Records Returned :'+result);
                this.accRecords = result;
            })
            .catch(error=>{
                console.log('Error while fetching Records :'+error);
            })
        }
}