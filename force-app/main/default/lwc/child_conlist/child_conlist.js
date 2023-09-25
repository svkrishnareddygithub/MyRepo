import { LightningElement,wire,api,track } from 'lwc';
import getContacts from '@salesforce/apex/Acc_Con_List.getContacts';
const colm=[
    {label:"FirstName",fieldName:'FirstName',type:'text'},
    {label:"LastName",fieldName:'LastName',type:'text'},
    {label:"Email",fieldName:'Email',type:'text'},
];
export default class Child_conlist extends LightningElement {
    
    @track accountId=[];
    @track records;
    @track errorMsg;
    col=colm;
    handleChangeAction(event){
       // alert('1');
        this.accountId=event.detail;
        
    }
    @wire(getContacts,{accId:'$accountId'}) 
    krishna({error,data}){
        if(data){
            this.records=data;
            this.errorMsg=undefined;
        }else{
            this.errorMsg=error;
            this.records=undefined;
        }
    }
   
}