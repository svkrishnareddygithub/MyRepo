import { LightningElement,track,wire,api } from 'lwc';
import create from '@salesforce/apex/Account_Insert.create';
import { createRecord } from 'lightning/uiRecordApi';
import {NavigationMixin} from 'lightning/navigation';
export default class Insert_account extends NavigationMixin(LightningElement) {
  @track  name;
  @track rating;
  @track  phone;
    
    aName(event){
     this.name=event.target.value;
    }
    aRating(event){
        this.rating=event.target.value;
    }
    aPhone(event){
        this.phone=event.target.value;
    }
    createMe(event){
        const fields={'Name':this.name,'Rating':this.rating,'Phone':this.phone};
        const rec={apiName:'Account',fields};
        createRecord(rec).then(Response=>{
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: Response.id,
                    //objectApiName: 'Account',
                    actionName: 'view'
                },
             });
        }).catch(error=>{
            alert('failed');
        });
        
    }
}