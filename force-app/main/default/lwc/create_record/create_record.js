import { LightningElement ,api} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import Name_FIELD from '@salesforce/schema/Account.Name';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
export default class Create_record extends LightningElement {
    @api objectApiName;
    fields=[Name_FIELD,RATING_FIELD,PHONE_FIELD];
    handleMe(event){
        const evt = new ShowToastEvent({
            title: 'record created',
            message: 'Record ID: ' + event.detail.id,
            
            variant: 'success',
        });
        this.dispatchEvent(evt);
    }
}