import { LightningElement,wire, api,track } from 'lwc';
// import { getPicklistValues } from 'lightning/uiObjectInfoApi';
// import { getObjectInfo } from 'lightning/uiObjectInfoApi';
// import ap from  '@salesforce/schema/OppServices__c.App__c';
// import tech from  '@salesforce/schema/OppServices__c.Technologies__c';
// import getTechnology from '@salesforce/apex/opp_tracking_class.getTechnology';
export default class Opp_tracking_child extends LightningElement {

//     @wire(getObjectInfo, { objectApiName:'OppServices__c' }) obj;
//     @wire(getPicklistValues, { recordTypeId: '$obj.data.defaultRecordTypeId', fieldApiName: ap})
//     appData;
//     @wire(getPicklistValues, { recordTypeId: '$obj.data.defaultRecordTypeId', fieldApiName: tech})
//     techData(data, error){
//         if(data && data.data && data.data.values){
//             data.data.values.forEach( objPicklist => {
//                 this.techValues.push({
//                     label: objPicklist.label,
//                     value: objPicklist.value
//                 });
//             });
//         } else if(error){
//             console.log(error);
//         }
//     };

//     selectedApp;
//     @track selectedtechValues = [];
//     @track techValues = [];
//    @wire (getTechnology,{service:'$selectedApp'}) krishna;
//     cptrApp(event){
//         this.selectedApp=event.target.value;
//         alert(this.krishna.data);
//     }  
//     cptrTech(event) {
//         this.selectedtechValues = event.detail.value;
//     }

}