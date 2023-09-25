import { LightningElement ,api} from 'lwc';
import NAME_FIELD  from '@salesforce/schema/Contact.LastName';
import FirstName_Field from '@salesforce/schema/Contact.FirstName';
export default class View_form extends LightningElement {
    nameField=NAME_FIELD ;
   // firstNameField=FirstName_Field;
    @api objectApiName;
    @api recordid;
    
}