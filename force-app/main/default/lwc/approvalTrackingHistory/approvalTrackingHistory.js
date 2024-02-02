import { LightningElement, api, wire } from 'lwc';
import PromotionRecords from '@salesforce/apex/ApprovalTrackingHistory.PromotionRecords';
import getPromotionApprovalHistory from '@salesforce/apex/ApprovalTrackingHistory.getPromotionApprovalHistory';

const columns = [
    { label: 'STEP NAME', fieldName: 'Name', type: 'text' },
    { label: 'STEP STATUS', fieldName: 'StepStatus', type: 'text' },
    { label: 'COMMENTS', fieldName: 'Comments', type: 'text' },
    { label: 'CREATED DATE', fieldName: 'CreatedDate', type: 'date' },
    { label: 'ACTOR', fieldName: 'Actor', type: 'text' },
  /*  {
        label: 'ASSIGNED TO',
        fieldName: 'ActorsFormatted',
        type: 'text',
        typeAttributes: {
            template: 'multiLine',
        },
    },
    */
];

export default class ApprovalTrackingHistory extends LightningElement {

    @api recordId;
    options;
    columns = columns;
    approvalHistory;

    @wire(PromotionRecords, { userStoryId: '$recordId' })
    wiredPromotions({ error, data }) {
        if (data) {
            this.options = data.map(promotion => ({
                label: promotion.Name,
                value: promotion.Id
            }));
        } else if (error) {
            console.error('Failed to fetch data', error);
        }
    }
  
    handleComboboxChange(event){
        var promId = event.target.value;
         getPromotionApprovalHistory({ promotionId: promId }).then(result => {
             this.approvalHistory = this.formatApprovalHistory(result);
         }).catch(error => {
             console.error('Failed to fetch approval history', error);
             this.approvalHistory = [];
         });
     }
 
     formatApprovalHistory(history) {
         return history.map(item => ({
             ...item,
             ActorsFormatted: item.Actors ? item.Actors.join(', ') : 'No Actors'
         }));
     }


}