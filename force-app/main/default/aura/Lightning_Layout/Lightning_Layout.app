<aura:application extends="force:slds" >
	<lightning:layout multipleRows="true">
        <lightning:layoutItem size="12" padding="around-medium" flexibility="auto">
          <lightning:card >
             <aura:set attribute="title">
                 <lightning:avatar fallbackIconName="standard:account" />
                Account<br/>
              </aura:set>
              <aura:set attribute="actions" >
                  <lightning:button label="save" />
                  <lightning:button label="cancel"/>
              </aura:set>
              <div>
                &nbsp;&nbsp;  AccountName : Wipro<br/>
                  
              </div>
           </lightning:card>       
        </lightning:layoutItem>
        <lightning:layoutItem size="12" padding="around-medium" flexibility="auto">
           <lightning:layout>
               <lightning:layoutItem padding="around-small" size="3" flexibility="auto">
                 <lightning:card title="block2">
                     <lightning:input label="label" />
                   </lightning:card>
               </lightning:layoutItem>
               <lightning:layoutItem size="6" padding="around-small" flexibility="auto">
                    <lightning:card title="block3">
                        <lightning:input  label="Name"/>
                    </lightning:card>
               </lightning:layoutItem>
               <lightning:layoutItem size="3" flexibility="auto" padding="around-small">
                  <lightning:card title="block4">
                      
                   </lightning:card>
                </lightning:layoutItem>
            </lightning:layout>
        </lightning:layoutItem>
    </lightning:layout>
</aura:application>