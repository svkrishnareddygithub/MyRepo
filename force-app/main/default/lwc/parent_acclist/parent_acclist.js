import { LightningElement,api,track,wire} from 'lwc';
import getAccounts from '@salesforce/apex/Acc_Con_List.getAccounts';
export default class Parent_acclist extends LightningElement {
@wire(getAccounts) krishna;
@track temp;
@track ids=[];
@track getId;
handleMe(event){
    // //alert(this.ids+' Record Id');
    // this.getId=event.target.value;
    // this.ids.push(this.getId);
    // const evt=new CustomEvent('createme',{detail:this.ids});
    // this.dispatchEvent(evt);
    //this.temp=true;
    this.getId=event.target.value;
    this.ids.push(this.getId);
}
show(event)
{
    //alert(this.ids+' Record Id');
    // if(this.temp==true)
    // {
        
        const evt=new CustomEvent('createme',{detail:this.ids});
        this.dispatchEvent(evt);
    //}
   
}
}