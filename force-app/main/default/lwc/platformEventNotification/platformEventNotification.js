import { LightningElement,track } from 'lwc';
import { subscribe, unsubscribe, onError , setDebugFlag, isEmpEnabled} from 'lightning/empApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class PlatformEventNotification extends LightningElement {
    channelName = '/event/Order_Event__e';
    replayId = '-2';
    id = 1;
    subscription = {};
    orderNumber ;
    @track
    orderList = [{
        id : "1",
        orderNo : "test"
    }];
    connectedCallback(){
        this.subscribeEvent();
    }

    handleChange(event){
        this.orderNumber = event.target.value;
        console.log('Orig Order No: '+ this.orderNumber);
    }

    showToast(orderNo){
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'New Order',
                message: 'Order created ID:' + orderNo,
                variant: 'success',
            }),
        );
    }
    subscribeEvent(){
        console.log('In the subscribing Method');
        var callbackfunction = response => {
            var onumber= response.data.payload.Order_Number__c;
            this.id = this.id + 1;
            var tempOrder = {
                id : this.id,
                orderNo : onumber
            };
            this.orderNumber = onumber;
            //console.log('Temp Order : '+ tempOrder);
            console.log('Orig Order No: '+ this.orderNumber);
            console.log('Orig Order List: '+ JSON.stringify(this.orderList));
            this.orderList.push(tempOrder);
            console.log('Orig OrderList Size: '+ this.orderList.length);
            this.showToast(onumber);            
        };
        
        subscribe(this.channelName, this.replayId, callbackfunction)
        .then (subResult => {
            console.log ('Subscribe Method Response : '+ JSON.stringify(subResult));
            this.subscription = subResult;
        } ) ;
    }
}