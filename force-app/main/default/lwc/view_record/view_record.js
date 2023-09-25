import { LightningElement ,api} from 'lwc';
import Name from '@salesforce/schema/Account.Name';
import Rating from '@salesforce/schema/Account.Rating';
export default class View_record extends LightningElement {
    @api objectApiName;
    @api  recordId;
    fields=[Name,Rating];
    
}