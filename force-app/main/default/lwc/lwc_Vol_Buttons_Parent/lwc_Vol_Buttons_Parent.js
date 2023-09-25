import { LightningElement } from 'lwc';

export default class Lwc_Vol_Buttons_Parent extends LightningElement {
    vol=0;
    dechandler(event){
        if(this.vol>0){
            this.vol=this.vol-1;
        }
    }
    inchandler(event){
        if(this.vol<100){
            this.vol=this.vol+1;
        }
    }
}