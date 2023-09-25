import { LightningElement,track,api } from 'lwc'; 

export default class Parent_cmp_p_to_c extends LightningElement {
    @api Name;
    @api Rating;
    @api Phone;
    handleMe(event){
        this.Name=this.template.querySelector('.name').value;
        this.Rating=this.template.querySelector('.rating').value;
        this.Phone=this.template.querySelector('.phone').value;
        var fullValues={
            getName:this.Name,
            getRating:this.Rating,
            getPhone:this.Phone
        };
        this.template.querySelector("c-child_cmp_p_to_c").displayChildValues(fullValues);
        this.Name=this.template.querySelector('.name').value='';
        this.Rating=this.template.querySelector('.rating').value='';
        this.Phone=this.template.querySelector('.phone').value='';
    }
}