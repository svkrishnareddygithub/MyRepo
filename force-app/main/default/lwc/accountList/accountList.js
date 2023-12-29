import { LightningElement, wire } from 'lwc';
import { getListUi } from 'lightning/uiListApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class AccountList extends LightningElement {
    accounts;

    @wire(getListUi, {
        objectApiName: ACCOUNT_OBJECT.objectApiName,
        listViewApiName: 'All Accounts' // Replace with the name of your desired list view
    })
    wiredAccountData({ error, data }) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            console.error('Error fetching account data:', error);
        }
    }
}