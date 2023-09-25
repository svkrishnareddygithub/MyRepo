import { LightningElement, wire,api,track } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import Biz_Domain from '@salesforce/schema/DX_Internal__c.Biz_Domain__c';
import Sub_Domain from '@salesforce/schema/DX_Internal__c.Sub_Domain__c';

//import { getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
export default class Dx_internal extends LightningElement {

  @wire(getObjectInfo,{objectApiName:'DX_Internal__c'}) obj;

  @track BizDomainValues =[];

  @track SubDomainValues=[];
  showBizDomin;
  dependentPicklist;
  @wire(getPicklistValuesByRecordType, { objectApiName: 'DX_Internal__c', recordTypeId: '$obj.data.defaultRecordTypeId' })
    fetchPicklist({ error, data }) {

        if (data && data.picklistFieldValues) {
            data.picklistFieldValues["Biz_Domain__c"].values.forEach(optionData => {
                this.BizDomainValues.push({ label: optionData.label, value: optionData.value });
            });
            this.dependentPicklist = data.picklistFieldValues["Sub_Domain__c"];
            this.showBizDomin = true;
        }
    };
    dependentDisabled = true;
    showdependent = false;
    @track finalDependentVal = [];
    selectedBizDomin;
    bizDominHandler(event) {
        this.finalDependentVal = [];
        this.showdependent = false;
        this.selectedBizDomin = event.target.value;
       // alert(this.selectedBizDomin)
        let controllerValues = this.dependentPicklist.controllerValues;
       // alert(controllerValues)
        this.dependentPicklist.values.forEach(depVal => {
           // alert(depVal)
            depVal.validFor.forEach(depKey => {
                if (depKey === controllerValues[this.selectedBizDomin]) {
                    this.dependentDisabled = false;
                    this.showdependent = true;
                    this.finalDependentVal.push({ label: depVal.label, value: depVal.value });
                }
            });

        });
    }
    subDomine;
    subDomineHandler(event){
        this.subDomine=event.target.value;
    }
}