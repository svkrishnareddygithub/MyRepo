import { LightningElement,wire,api, track } from 'lwc';
import { reduceErrors } from 'c/ldsUtils';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import First_Name from '@salesforce/schema/Contact.FirstName';
import Last_Name from '@salesforce/schema/Contact.LastName';
import Email from '@salesforce/schema/Contact.Email';
export default class ContactList extends LightningElement {
@wire (getContacts) krishna;
get errors() {
    return (this.krishna.error) ?
        reduceErrors(this.krishna.error) : [];
}
@track col=[
            {label:'FirstName',FieldName:First_Name.fieldApiName,type:'text'},
            {label:'LastName',FieldName:Last_Name,type:'text'},
            {label:'Email',FieldName:Email.fieldApiName,type:'text'}
];
}