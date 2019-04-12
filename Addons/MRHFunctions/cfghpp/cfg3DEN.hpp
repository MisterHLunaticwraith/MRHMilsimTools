#define SEARCH_COND condition = "(1-objectBrain)*(1-objectAgent)*(1-objectVehicle)"
#define HACK_COND condition = "(1-objectBrain)*(1-objectAgent)*(1-objectVehicle)"
// Configuration of all objects
class object
{
    // Categories collapsible in "Edit Attributes" window
    class AttributeCategories
    {

        

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
                    expression = "if (_value) then {[_this] call MRH_fnc_MilsimTools_Functions_simpleConvFromAttributes};";
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
                    defaultValue = "";
                    unique = 0; 
                    validate = "none";
                    condition = "objectBrain";
                    typeName = "STRING";
                };

            };
        };

        class mrh_search_object_attributes
        {
            displayName = $STR_MRH_FUNCS_SearchObjectTitleATT;
                collapsed = 1;
                class Attributes
                {
                    
                    class MRH_objectCanBeSearched
                    {
                    
                        displayName = $STR_MRH_FUNCS_objectCanBeSearchedATT; 
                        tooltip = $STR_MRH_FUNCS_objectCanBeSearchedATTToolTip; 
                        property = "mrh_can_search_obj"; 
                        control = "CheckboxState";    
                        expression = "if (_value) then {[_this] call MRH_fnc_MilsimTools_Functions_searchObjectFromAttributes};";
                        defaultValue = false;
                        unique = 0; 
                        validate = "none";
                        SEARCH_COND;
                        typeName = "BOOL";
                    };
                    class MRH_successfulSearch
                    {
                    
                        displayName = $STR_MRH_FUNCS_SearchWillBeSuccATT; 
                        tooltip = $STR_MRH_FUNCS_SearchWillBeSuccATTTooltip; 
                        property = "mrh_search_obj_success"; 
                        control = "Checkbox";    
                        expression = "_this setVariable ['%s',_value]";
                        defaultValue = false;
                        unique = 0; 
                        validate = "none";
                        SEARCH_COND;
                        typeName = "BOOL";
                    };

                    class MRH_object_Found
                    {
                    
                        displayName = $STR_MRH_FUNCS_NameOfFoundObjectATT; 
                        tooltip = $STR_MRH_FUNCS_NameOfFoundObjectATTToolTip; 
                        property = "mrh_search_nameFound"; 
                        control = "Edit";    
                        expression = "_this setVariable ['%s',_value]";
                        defaultValue = "name of object";
                        unique = 0; 
                        validate = "none";
                        SEARCH_COND;
                        typeName = "STRING";
                    };
                    
                    class MRH_object_Found_code
                    {
                    
                        displayName = $STR_MRH_FUNCS_CodeToRunWhenObjectATT; 
                        tooltip = $STR_MRH_FUNCS_CodeToRunWhenObjectATTToolTip; 
                        property = "mrh_search_CodeFound"; 
                        control = "EditCodeMulti5";    
                        expression = "_this setVariable ['%s',_value]";
                        defaultValue = "params ['_searchedObject']";
                        unique = 0; 
                        validate = "none";
                        SEARCH_COND;
                        typeName = "STRING";
                    };
                    
                    class MRH_message_help
                    {
                    
                        displayName = "help"; 
                        tooltip = ""; 
                        description = $STR_MRH_FUNCS_SearchObjectDescHelp; 
                        property = "mrh_search_helpDesc"; 
                        control = "StructuredText2";    
                        expression = "";
                        defaultValue = "";
                        unique = 0; 
                        validate = "none";
                        SEARCH_COND;
                        typeName = "STRING";
                    };
                    
                };
        };
         
        class mrh_hackDownloadAndCollectData_attributes
        {
            displayName = "MRH add hack and download files";
            collapsed = 1;
                class Attributes
                {
                    
                    class MRH_objectAddHack
                    {
                    
                        displayName = "Add hack and collectible data to object"; 
                        tooltip = ""; 
                        property = "mrh_hackAndCollectData"; 
                        control = "CheckboxState";    
                        expression = "if (_value) then {[_this] call MRH_fnc_MilsimTools_Functions_addHackFromAttributes};";
                        defaultValue = false;
                        unique = 0; 
                        validate = "none";
                        HACK_COND;
                        typeName = "BOOL";
                    };

                    class MRH_objectHackDuration
                    {
                    
                        displayName = "Hack duration"; 
                        tooltip = ""; 
                        property = "mrh_hackAndCollectDataHackDuration"; 
                        control = "EditShort";    
                        expression = "_this setVariable ['%s',_value]";
                        defaultValue = "10";
                        unique = 0; 
                        validate = "none";
                        HACK_COND;
                        typeName = "STRING";
                    };

                    class MRH_objectHackFileSize
                    {
                    
                        displayName = "File size in Mo"; 
                        tooltip = ""; 
                        property = "mrh_hackAndCollectDataHackFileSize"; 
                        control = "EditShort";    
                        expression = "_this setVariable ['%s',_value]";
                        defaultValue = "10";
                        unique = 0; 
                        validate = "none";
                        HACK_COND;
                        typeName = "STRING";
                    };

                    class MRH_objectHackDataReceived
                    {
                    
                        displayName = "Tablet data to receive"; 
                        tooltip = ""; 
                        property = "mrh_hackAndCollectDataHackData"; 
                        control = "Edit";    
                        expression = "_this setVariable ['%s',_value]";
                        defaultValue = "[""MRH_SdTabTestDataEntry"",""MRH_WP_M4""]";
                        unique = 0; 
                        validate = "none";
                        HACK_COND;
                        typeName = "STRING";
                    };
                    class MRH_objectHackPicturesReceived
                    {
                    
                        displayName = "Tablet pictures to receive"; 
                        tooltip = ""; 
                        property = "mrh_hackAndCollectPicsHack"; 
                        control = "Edit";    
                        expression = "_this setVariable ['%s',_value]";
                        defaultValue = "[""MRH_poweredByMilsimtools"",""MRH_WP_M4""]";
                        unique = 0; 
                        validate = "none";
                        HACK_COND;
                        typeName = "STRING";
                    };
                };
        };
              
        
    };
};
