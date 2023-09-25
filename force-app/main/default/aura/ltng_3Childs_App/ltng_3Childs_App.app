<aura:application extends="force:slds">
    <lightning:layout multipleRows="true">
          <lightning:layoutItem size="12">
             <c:ltng_Child1/>
        </lightning:layoutItem> <br/><br/>
        <lightning:layoutItem size="1"></lightning:layoutItem>
           <lightning:layoutItem size="5">
             <c:ltng_Child2/>
           </lightning:layoutItem>
          <lightning:layoutItem size="1"></lightning:layoutItem>
        
           <lightning:layoutItem size="5">
              <div class="slds-scrollable_y" style="height:5rem;width:24rem">
               <c:ltng_Child3/>
              </div>
           </lightning:layoutItem>
        
    </lightning:layout>
</aura:application>