
// Configuration of all objects
class object
{
    // Categories collapsible in "Edit Attributes" window
    class AttributeCategories
    {
        // Category class, can be anything
        

           class mrh_simpleConv
           {
               displayName = $STR_MRH_FUNCS_SimpleACe_AttributesTitle;
                collapsed = 1;
                class Attributes
                {
                    
                    class MRH_message_addConversation
                    {
                       
                        displayName = $STR_MRH_FUNCS_AddAConvToTheUnit; 
                        tooltip = $STR_MRH_FUNCS_SimpleMessageATTDESC; 
                        property = "mrh_hasConv"; 
                        control = "CheckboxState";    
                        expression = "[_this] call MRH_fnc_MilsimTools_Functions_simpleConvFromAttributes";
                        defaultValue = false;
                        unique = 0; 
                        validate = "none";
                        condition = "objectBrain";
                        typeName = "BOOL";
                    };
                    class MRH_message_conversationText
                    {
                       
                        displayName = $STR_MRH_FUNCS_MessageTextATT; 
                        tooltip = $STR_MRH_FUNCS_MessageTextTooltip; 
                        property = "mrh_textMess"; 
                        control = "EditMulti5";    
                        expression = "_this setVariable ['%s',_value]";
                        defaultValue = "Write the message here";
                        unique = 0; 
                        validate = "none";
                        condition = "objectBrain";
                        typeName = "STRING";
                    };

                    class MRH_message_codeToExecute
                    {
                       
                        displayName = $STR_MRH_FUNCS_MessageCodeToExecATT; 
                        tooltip = $STR_MRH_FUNCS_MessageCodeToolTip; 
                        property = "mrh_message_codeToExec"; 
                        control = "EditCodeMulti5";    
                        expression = "_this setVariable ['%s',_value]";
                        defaultValue = "_unit = _this select 0;_passedParameters = (_this select 1);";
                        unique = 0; 
                        validate = "none";
                        condition = "objectBrain";
                        typeName = "STRING";
                    };
                    class MRH_message_parametersPassed
                    {
                       
                        displayName = $STR_MRH_FUNCS_ParametersPassedATT; 
                        tooltip = $STR_MRH_FUNCS_MessageParamsToolTip; 
                        property = "mrh_message_passedParams"; 
                        control = "EditCode";    
                        expression = "_this setVariable ['%s',_value]";
                        defaultValue = "[]";
                        unique = 0; 
                        validate = "none";
                        condition = "objectBrain";
                        typeName = "STRING";
                    };
                    class MRH_message_runCodeGlobally
                    {
                       
                        displayName = $STR_MRH_FUNCS_GlobalExecATT; 
                        tooltip = $STR_MRH_FUNCS_MessageGlobalToolTip; 
                        property = "mrh_message_isGlobalCode"; 
                        control = "Checkbox";    
                        expression = "_this setVariable ['%s',_value]";
                        defaultValue = false;
                        unique = 0; 
                        validate = "none";
                        condition = "objectBrain";
                        typeName = "BOOL";
                    };
                    class MRH_message_removeActionAfterUse
                    {
                       
                        displayName = $STR_MRH_FUNCS_RemoveActionAfterATT; 
                        tooltip = $STR_MRH_FUNCS_MessageRemoveAfterUseToolTip; 
                        property = "mrh_message_removeAction"; 
                        control = "Checkbox";    
                        expression = "_this setVariable ['%s',_value]";
                        defaultValue = false;
                        unique = 0; 
                        validate = "none";
                        condition = "objectBrain";
                        typeName = "BOOL";
                    };
                    class MRH_message_help
                    {
                       
                        displayName = "help"; 
                        tooltip = ""; 
                        description = $STR_MRH_FUNCS_SimpleMessageATTDESC; 
                        property = "mrh_helpDesc"; 
                        control = "StructuredText2";    
                        expression = "";
                        defaultValue = false;
                        unique = 0; 
                        validate = "none";
                        condition = "objectBrain";
                        typeName = "BOOL";
                    };

                };
           };
/*
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
                            expression = "[_this] call MRH_fnc_MilsimTools_MiscItems_isRefillBoxFromAttributes";
                            defaultValue = false;
                            unique = 0; 
                            validate = "none";
                            condition = "objectHasInventoryCargo";
                            typeName = "BOOL";
                        }; 
                    };
            };  
        */
    };
};
