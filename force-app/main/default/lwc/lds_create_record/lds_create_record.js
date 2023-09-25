import { LightningElement,track ,api} from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';
export default class Lds_create_record extends NavigationMixin(LightningElement) {
    @track name;
    @track rating;
    @track phone;
    captureName(event){
      this.name=event.target.value;
    }
    captureRating(event){
        this.rating=event.target.value;
    }
    capturePhone(event){
        this.phone=event.target.value;
    }
    createMe(event){
      const fields={'Name':this.name,'Rating':this.rating,'Phone':this.phone};
      const  recordData={apiName:'Account',fields};
      createRecord(recordData).then(Response=>{
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: Response.id,
                objectApiName: 'Account', 
                actionName: 'view'
            },
        });
      }).catch(error=>{
        alert('failed');
      });
    }
   
}