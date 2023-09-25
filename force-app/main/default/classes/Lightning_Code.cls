public class Lightning_Code {
/*
    <aura:component >
        <aura:attribute name="name" type="String"/>
        <aura:attribute name="age" type="Integer"/>
        <aura:attribute name="salary" type="decimal"/>
        <aura:attribute name="city" type="String"/>
        <div>
            Name : {!v.name}<br/>
            Age  : {!v.age} <br/>
            Salary: {!v.salary}<br/>k
            City : {!v.city}
        </div>
    </aura:component>
    <aura:application extends="force:slds" >
        <c:Lightning_Component_1 name="krishna" age="22" salary="200" city="Hyd"/>
    </aura:application>
------------------------------------------------------------------------------------------------------------------------------
      <aura:component >
        <aura:attribute name="name" type="String"/>
        <aura:attribute name="salary" type="decimal"/>
        <aura:attribute name="exp" type="integer" />
        <aura:attribute name="bonus" type="decimal"/>
        <aura:handler  name="init" value="{!this}" action="{!c.call}"/>
        <div>
            Name  : {!v.name}<br/>
            Salary :{!v.salary}<br/>
            Exp  : {!v.exp}<br/>
            Bonus : {!v.bonus}
        </div>
      </aura:component> 
        ({
            call :function (component,event,helper){
                var name=component.get("v.name");
                var sal=component.get("v.salary");
                var exp=component.get("v.exp");
                var bon=0;
                if(exp>2){
                    bon=sal*0.4;
                }else{
                     bon=sal*0.2;
                }
                component.set("v.bonus",bon);
            }
            
        })
        <aura:application extends="force:slds" >
            <c:Lightning_Component_2  name="krishna" salary="1000" exp="3"  />
        </aura:application>
----------------------------------------------------------------------------------------------------------
      <aura:component >
        <aura:attribute name="Name"  type="String"/>
        <aura:attribute name="Salary" type="decimal"/>
        <lightning:button label="Submit"  onclick="{!c.call}"/>
        
        <div>
            Name : {!v.Name} <br/>
            Salary : {!v.Salary}
        </div>
    </aura:component>
    ({
        call : function(component, event, helper) {
            component.set("v.Name","krishnareddy");
            component.set("v.Salary","300");
        }
    })
         <aura:application extends="force:slds" >
            <c:Lightning_Component_3/>
        </aura:application>
---------------------------------------------------------------------------------------
        <aura:component >
            <lightning:input label="fName" aura:id="fName"/>
            <lightning:input label="lName" aura:id="lName"/>
            <aura:attribute name="Name" type="String" />
            <lightning:button label="Submit" onclick="{!c.call}"/>
            <div>
              Name: {!v.Name}
            </div>
        </aura:component>
         ({
            call : function(component, event, helper) {
                var fname=component.find("fName").get("v.value");
                console.log(fname);
                var lname=component.find("lName").get("v.value");
                console.log(lname);
                var name=fname+lname;
                component.set("v.Name",name);
            }
        })
         <aura:application extends="force:slds" >
            <c:Lightning_Component_3/>
            <c:Lightning_Component_4/>
        </aura:application>
=====================================================================================
        <aura:component >
            <lightning:input label="Aval" aura:id="Aval" />
            <lightning:input label="Bval" aura:id="Bval"/>
            <lightning:input label="Result" aura:id="Result"/>
            <lightning:button label="Add" onclick="{!c.add}"/>
            <lightning:button label="Mul" onclick="{!c.mul}"/>
        </aura:component>
        ({
            add : function(component, event, helper) {
                var av=component.find("Aval").get("v.value");
                var bv=component.find("Bval").get("v.value");
                var res=parseInt(av)+parseInt(bv);
                component.find("Result").set("v.value",res);
            },
            mul : function(component, event, helper) {
                var av=component.find("Aval").get("v.value");
                var bv=component.find("Bval").get("v.value");
                var res=parseInt(av)*parseInt(bv);
                component.find("Result").set("v.value",res);
            }
        })
        <aura:application extends="force:slds" >
            <c:Lightning_Component_3/>
            <c:Lightning_Component_4/>
            <c:Lightning_Component_5/>
        </aura:application>
*/
}