import { LightningElement } from 'lwc';

export default class Randomnumber extends LightningElement {
    num;
    ranNum;
    result;
    sel;
    connectedCallback(){
      this.ranNum=parseInt(Math.random()*50);
    }
    handleMe(event){
        this.num=event.target.value;
    }
    count=0;
    flag=false;
    clickMe(event){
        this.count+=1;
       if(this.num!=this.ranNum && this.num<this.ranNum){
            this.sel=''
            if(this.count!=5){
              var num=5-this.count;
              this.result='Wrong number and you have '+num+' more attempts, Enter big Number';
            }else{
                this.result='You loss the game correct number is '+this.ranNum;
                this.flag=true;
            }
       }else if(this.num!=this.ranNum && this.num>this.ranNum){
        this.sel=''
            if(this.count!=5){
                var num=5-this.count;
                this.result='Wrong number and you have '+num+' more attempts, Enter small Number';
            }else{
                this.result='You loss the game correct Number is '+this.ranNum;
                this.flag=true;
            }
       }else if(this.num==this.ranNum){
            this.result="You Won the Game";
       }
    }
}