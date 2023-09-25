import { LightningElement,api,wire,track } from 'lwc';

export default class Simple_code extends LightningElement {
    @track name;
    captureName(event){
       this.name=event.target.value;
    }
    handleMe(event){
        const evt=new CustomEvent('pass',{detail:this.name});
        this.dispatchEvent(evt);
    }
}