import { LightningElement,track,api } from 'lwc';

export default class Child_cmp_p_to_c extends LightningElement {
   @api accName;
   @api accRating;
   @api accPhone;
   @api
   displayChildValues(event){
   this.accName=event.getName;
   this.accRating=event.getRating;
   this.accPhone=event.getPhone;
   }
    acc={Name:this.accName,Rating:this.Rating,Phone:this.accPhone};
    col=[
        {label:"Name",fieldName:"Name",type:"text"},
        {label:"Rating",fieldName:"Rating",type:"text"},
        {label:"Phone",fieldName:"Phone",type:"text"}
    ];
}