
// Configuration of all objects
class object
{
    // Categories collapsible in "Edit Attributes" window
    class AttributeCategories
    {
        // Category class, can be anything
        

           class mrh_ammoCrateAttributes
           {
               displayName = $STR_MRH_MRHMiscItems_AmmoCrateAttributesCat;
                collapsed = 1;
                class Attributes
                {
                    
                    class MRH_isAmmoCrate
                    {
                       
                        displayName = $STR_MRH_MRHMiscItems_IsRefillAmmoSet; 
                        tooltip = $STR_MRH_MRHMiscItems_AmmocrateDescAndTooltip; 
                        property = "mrh_isAmmoCrate"; 
                        control = "CheckboxState";    
                        expression = "[[_this],{_this call MRH_fnc_MilsimTools_MiscItems_ammoCrateFromAttributes}] RemoteExec ['Call',0,true]";
                        defaultValue = false;
                        unique = 0; 
                        validate = "none";
                        condition = "objectHasInventoryCargo";
                        typeName = "BOOL";
                    };
                    class MRH_numberOfammo
                    {
                       
                        displayName = $STR_MRH_MRHMiscItems_NumberOfMagsSet; 
                        tooltip = $STR_MRH_MRHMiscItems_AmmocrateDescAndTooltip; 
                        property = "mrh_AmmoCrateNumberItem"; 
                        control = "EditShort";    
                        expression = "_this setVariable ['%s',_value,true]";
                        defaultValue = "10";
                        unique = 0; 
                        validate = "none";
                        condition = "objectHasInventoryCargo";
                        typeName = "STRING";
                    };

                    class MRH_ammoContentIsInfinite
                    {
                       
                        displayName = $STR_MRH_MRHMiscItems_InfiniteRefillSet; 
                        tooltip = $STR_MRH_MRHMiscItems_AmmocrateDescAndTooltip; 
                        property = "mrh_infiniteAmmoRefill"; 
                        control = "Checkbox";    
                        expression = "_this setVariable ['%s',_value,true]";
                        defaultValue = false;
                        unique = 0; 
                        validate = "none";
                        condition = "objectHasInventoryCargo";
                        typeName = "BOOL";
                    };
                    class MRH_ammoCrateCanBeRefreshed
                    {
                       
                        displayName = $STR_MRH_MRHMiscItems_CttRefreshSet; 
                        tooltip = $STR_MRH_MRHMiscItems_AmmocrateDescAndTooltip; 
                        property = "mrh_isRefreshableAmmoCrate"; 
                        control = "Checkbox";    
                        expression = "_this setVariable ['%s',_value,true]";
                        defaultValue = false;
                        unique = 0; 
                        validate = "none";
                        condition = "objectHasInventoryCargo";
                        typeName = "BOOL";
                    };
                    class isAmmoCrateDescription
                    {
                       
                        displayName = $STR_MRH_MRHMiscItems_IsRefillAmmoSet; 
                        tooltip = $STR_MRH_MRHMiscItems_AmmocrateDescAndTooltip; 
                        description = $STR_MRH_MRHMiscItems_AmmocrateDescAndTooltip; 
                        property = "mrh_isAmmoCrateDesc"; 
                        control = "StructuredText2";    
                        expression = "";
                        defaultValue = false;
                        unique = 0; 
                        validate = "none";
                        condition = "objectHasInventoryCargo";
                        typeName = "BOOL";
                    };

                };
           };

            class mrh_refillBoxAttributes
            {
                displayName = $STR_MRH_MRHMiscItems_RefillBoxAttributesCat;
                    collapsed = 1;
                    class Attributes
                    {
                        
                        class MRH_isInfiniteBox
                        {
                        
                            displayName = $STR_MRH_MRHMiscItems_isInfiniteBoxSet; 
                            tooltip = $STR_MRH_MRHMiscItems_isInfiniteBoxToolTip; 
                            property = "mrh_isRefillBox"; 
                            control = "Checkbox";    
                            expression = "[[_this],{_this call MRH_fnc_MilsimTools_MiscItems_isRefillBoxFromAttributes}] RemoteExec ['call',0,true]";
                            defaultValue = false;
                            unique = 0; 
                            validate = "none";
                            condition = "objectHasInventoryCargo";
                            typeName = "BOOL";
                        }; 
                    };
            };  
        
    };
};
