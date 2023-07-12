<aura:application extends= "force:slds" >
    <aura:attribute name="openRegistrationform" type="Boolean" default="False"/>
    <aura:attribute name="ButtonLabel" type="String" default="Open Registration form"/>
    
    <Lightning:button label="{!v.ButtonLabel}" onclick="{!c.openOrCloseRegistrationForm}"/>
    
    <aura:if isTrue="{!v.openRegistrationform}">
    	<c:FirstComponent/>
    </aura:if>
</aura:application>