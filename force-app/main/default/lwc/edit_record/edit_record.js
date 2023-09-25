import { LightningElement,api } from 'lwc';
import Name_Field from '@salesforce/schema/Account.Name';
import Rating_Field from '@salesforce/schema/Account.Rating';
export default class Edit_record extends LightningElement {
    @api objectApiName;
    @api recordId;
    fields=[Name_Field,Rating_Field];
    handleMe(event){
        const evt=new ShowToastEvent({
          title:'record updated',
          message:'record Id:'+ event.detail.id,
          variant:'success',
        });
        this.dispatchEvent(evt);
    }
}