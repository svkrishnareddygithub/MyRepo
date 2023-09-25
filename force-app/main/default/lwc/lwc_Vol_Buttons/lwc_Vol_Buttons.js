import { LightningElement } from 'lwc';

export default class Lwc_Vol_Buttons extends LightningElement {
    decreasevol(event){
       const dec=new CustomEvent("decrease");
       this.dispatchEvent(dec);
    }
    increasevol(event){
          this.dispatchEvent(new CustomEvent("increase"));
    }
}