import { LightningElement,api,wire,track } from 'lwc';
import getContacts from '@salesforce/apex/simple_class.getContacts';
export default class Simple_code_p extends LightningElement {
   col=[
    {label:'LastName',fieldName:'LastName',type:'text'},
    {label:'FirstName',fieldName:'FirstName',type:'text'},
    {label:'Email',fieldName:'Email',type:'text'}
];
   @track accName;
   @wire (getContacts,{name:'$accName'}) krishna;
   passtomethod(event){
      this.accName=event.detail;
    }
}