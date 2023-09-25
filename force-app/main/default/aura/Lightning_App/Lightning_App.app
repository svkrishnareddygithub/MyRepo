<aura:application extends="force:slds">
	<lightning:layout multipleRows="true">
     <lightning:layoutItem size="12" flexibility="auto" padding="around-medium">     
           <c:Lightning_Component1 />  
      </lightning:layoutItem>
        <lightning:layoutItem size="12" flexibility="auto" padding="around-medium">
             <lightning:layout >
                <lightning:layoutItem size="3" flexibility="auto" padding="around-medium">
                    <c:Lightning_Component2 />
                 </lightning:layoutItem>
                 <lightning:layoutItem size="6" flexibility="auto" padding="around-medium">
                     <c:Lightning_Component3 />
                 </lightning:layoutItem>
                 <lightning:layoutItem size="3" flexibility="auto" padding="around-medium">
                     <c:Lightning_Component4 />
                 </lightning:layoutItem>
            </lightning:layout>
        </lightning:layoutItem>
    </lightning:layout>
</aura:application>