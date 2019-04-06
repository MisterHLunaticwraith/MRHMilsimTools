
class MRH_BioScanner_Base: Static 
{};
class MRH_BioScanner : MRH_BioScanner_Base
{
	author = "Mr H";
	mapSize = 0.07;
	editorPreview = "";
	scope = 2;
	scopeCurator = 2;
	displayName = $STR_MRH_MRHMiscItems_bioscanDisp;
	model = "\MRHMiscItems\Models\BioScanner\MRH_bioscanner.p3d";
	
	icon = "iconObject_circle";
	editorCategory = "EdCat_MRH_Misc";
	editorSubcategory = "EdSubcat_MRH_Props";
	destrType = "DestructNo";
	cost = 100;
	hiddenSelections[] = {"mainscreen","handscreen"};
	hiddenSelectionsTextures[] = {
    "\MRHMiscItems\Models\BioScanner\Data\touchscreen_co.paa",
    "\MRHMiscItems\Models\BioScanner\Data\hand_scan_co.paa"
    };
	vehicleClass="signs";
	_generalMacro="MRH_BioScanner";
    /*
	class EventHandlers {
		init = "_this call MRH_fnc_MilsimTools_MiscItems_bioScannerInit;";
		
	};
    */
    class ACE_Actions {
        class MRH_Scanner_MainScreenAction
        {
            displayName = $STR_MRH_MRHMiscItems_cfgMainSCreen;
            icon = "";
            distance = 2;
            selection = "mem01";  
                
        };
        class MRH_Scanner_handScan
        {
            displayName = $STR_MRH_MRHMiscItems_cfgHandScan;
            icon = "";
            distance = 2;
            selection = "mem02";

                
        };
        class MRH_Scanner_EyeScanner
        {
            displayName = $STR_MRH_MRHMiscItems_cfgEyeScan;
            icon = "";
            distance = 2;
            selection = "mem03";
                
        }; 
        
    };


	class Attributes // Entity attributes have no categories, they are all defined directly in class Attributes
		{
			 class UseDefaultAceActions
                {
                    //--- Mandatory properties
                    displayName = $STR_MRH_MRHMiscItems_scannerUseAceACAttr; // Name assigned to UI control class Title
                    tooltip = $STR_MRH_MRHMiscItems_scannerUseAceACAttrToolTip; // Tooltip assigned to UI control class Title
                    property = "MRH_BS_useActions"; // Unique config property name saved in SQM
                    control = "CHECkBOX"; // UI control base class displayed in Edit Attributes window, points to Cfg3DEN >> Attributes
                    expression = "_this setVariable ['MRH_BS_UseCustomActions',_value,true]";
                    defaultValue = "false";
                    unique = 0; // When 1, only one entity of the type can have the value in the mission (used for example for variable names or player control)
                    validate = "none"; // Validate the value before saving. Can be "none", "expression", "condition", "number" or "variable"
                    condition = "object"; // Condition for attribute to appear (see the table below)
                    typeName = "BOOL"; // Defines data type of saved value, can be STRING, NUMBER or BOOL. Used only when control is "Combo", "Edit" or their variants
                };
			 class MainTouchScreen
                {
                    //--- Mandatory properties
                    displayName = $STR_MRH_MRHMiscItems_scannerCodeMainAttr; // Name assigned to UI control class Title
                    tooltip = $STR_MRH_MRHMiscItems_scannerCodeMainAttrToolTip; // Tooltip assigned to UI control class Title
                    property = "MRH_BS_codeTouchSCreen"; // Unique config property name saved in SQM
                    control = "EditCodeMulti3"; // UI control base class displayed in Edit Attributes window, points to Cfg3DEN >> Attributes

                    // Expression called when applying the attribute in Eden and at the scenario start
                    // The expression is called twice - first for data validation, and second for actual saving
                    // Entity is passed as _this, value is passed as _value
                    // %s is replaced by attribute config name. It can be used only once in the expression
                    // In MP scenario, the expression is called only on server.
                    expression = "[_this,_value,'main'] call MRH_fnc_MilsimTools_MiscItems_handleBioScannerActions;";

                    // Expression called when custom property is undefined yet (i.e., when setting the attribute for the first time)
                    // Entity is passed as _this
                    // Returned value is the default value
                    // Used when no value is returned, or when it's of other type than NUMBER, STRING or ARRAY
                    // Custom attributes of logic entities (e.g., modules) are saved always, even when they have default value
                    defaultValue = "";

                    //--- Optional properties
                    unique = 0; // When 1, only one entity of the type can have the value in the mission (used for example for variable names or player control)
                    validate = "none"; // Validate the value before saving. Can be "none", "expression", "condition", "number" or "variable"
                    condition = "object"; // Condition for attribute to appear (see the table below)
                    typeName = "STRING"; // Defines data type of saved value, can be STRING, NUMBER or BOOL. Used only when control is "Combo", "Edit" or their variants
                };

				 class handScanner
                {
                    //--- Mandatory properties
                    displayName = $STR_MRH_MRHMiscItems_scannerCodeHandAttr; // Name assigned to UI control class Title
                    tooltip = $STR_MRH_MRHMiscItems_scannerCodeHandAttrToolTip; // Tooltip assigned to UI control class Title
                    property = "MRH_BS_codeHandSCreen"; // Unique config property name saved in SQM
                    control = "EditCodeMulti3"; // UI control base class displayed in Edit Attributes window, points to Cfg3DEN >> Attributes
                    expression = "[_this,_value,'Hand'] call MRH_fnc_MilsimTools_MiscItems_handleBioScannerActions;";
                    defaultValue = "";
                    unique = 0; // When 1, only one entity of the type can have the value in the mission (used for example for variable names or player control)
                    validate = "none"; // Validate the value before saving. Can be "none", "expression", "condition", "number" or "variable"
                    condition = "object"; // Condition for attribute to appear (see the table below)
                    typeName = "STRING"; // Defines data type of saved value, can be STRING, NUMBER or BOOL. Used only when control is "Combo", "Edit" or their variants
                };

					 class EyeScanner
                {
                    //--- Mandatory properties
                    displayName = $STR_MRH_MRHMiscItems_scannerCodeEye; // Name assigned to UI control class Title
                    tooltip = $STR_MRH_MRHMiscItems_scannerCodeEyeToolTip; // Tooltip assigned to UI control class Title
                    property = "MRH_BS_codeEyeScan"; // Unique config property name saved in SQM
                    control = "EditCodeMulti3"; // UI control base class displayed in Edit Attributes window, points to Cfg3DEN >> Attributes
                    expression = "[_this,_value,'Eye'] call MRH_fnc_MilsimTools_MiscItems_handleBioScannerActions;";
                    defaultValue = "";
                    unique = 0; // When 1, only one entity of the type can have the value in the mission (used for example for variable names or player control)
                    validate = "none"; // Validate the value before saving. Can be "none", "expression", "condition", "number" or "variable"
                    condition = "object"; // Condition for attribute to appear (see the table below)
                    typeName = "STRING"; // Defines data type of saved value, can be STRING, NUMBER or BOOL. Used only when control is "Combo", "Edit" or their variants
                };

                class autoLockDoor
                {
                    //--- Mandatory properties
                    displayName = $STR_MRH_MRHMiscItems_scannerCtrlNearDoorAttr; // Name assigned to UI control class Title
                    tooltip = $STR_MRH_MRHMiscItems_scannerCtrlNearDoorAttrToolTip; // Tooltip assigned to UI control class Title
                    property = "MRH_BS_controlNearestDoor"; // Unique config property name saved in SQM
                    control = "CHECkBOX"; // UI control base class displayed in Edit Attributes window, points to Cfg3DEN >> Attributes
                    expression = "[_value,_this] spawn MRH_fnc_MilsimTools_MiscItems_bioScannerInit";
                    defaultValue = "false";
                    unique = 0; // When 1, only one entity of the type can have the value in the mission (used for example for variable names or player control)
                    validate = "none"; // Validate the value before saving. Can be "none", "expression", "condition", "number" or "variable"
                    condition = "object"; // Condition for attribute to appear (see the table below)
                    typeName = "BOOL"; // Defines data type of saved value, can be STRING, NUMBER or BOOL. Used only when control is "Combo", "Edit" or their variants
                };
                
                class objectToControl
                {
                    //--- Mandatory properties
                    displayName = $STR_MRH_MRHMiscItems_scannerCtrledItemAttr; // Name assigned to UI control class Title
                    tooltip = $STR_MRH_MRHMiscItems_scannerCtrledItemAttrToolTip; // Tooltip assigned to UI control class Title
                    property = "MRH_BS_ctrledObj"; // Unique config property name saved in SQM
                    control = "Edit"; // UI control base class displayed in Edit Attributes window, points to Cfg3DEN >> Attributes
                    expression = "_this setVariable ['MRH_ScannerSettings_controlledBuilding',_value,true]";
                    defaultValue = "objNull";
                    unique = 0; // When 1, only one entity of the type can have the value in the mission (used for example for variable names or player control)
                    validate = "none"; // Validate the value before saving. Can be "none", "expression", "condition", "number" or "variable"
                    condition = "object"; // Condition for attribute to appear (see the table below)
                    typeName = "STRING"; // Defines data type of saved value, can be STRING, NUMBER or BOOL. Used only when control is "Combo", "Edit" or their variants
                };

                class conditionOpenField
                {
                    //--- Mandatory properties
                    displayName = $STR_MRH_MRHMiscItems_scannerCondLockAttr; // Name assigned to UI control class Title
                    tooltip = $STR_MRH_MRHMiscItems_scannerCondLockAttrToolTip; // Tooltip assigned to UI control class Title
                    property = "MRH_BS_conditionOpen"; // Unique config property name saved in SQM
                    control = "EditCodeMulti3"; // UI control base class displayed in Edit Attributes window, points to Cfg3DEN >> Attributes
                    expression = "_this setVariable ['MRH_ScannerSettings_conditionUnlock',_value,true]";
                    defaultValue = "";
                    unique = 0; // When 1, only one entity of the type can have the value in the mission (used for example for variable names or player control)
                    validate = "none"; // Validate the value before saving. Can be "none", "expression", "condition", "number" or "variable"
                    condition = "object"; // Condition for attribute to appear (see the table below)
                    typeName = "STRING"; // Defines data type of saved value, can be STRING, NUMBER or BOOL. Used only when control is "Combo", "Edit" or their variants
                };

                 class forceUseEye
                {
                    //--- Mandatory properties
                    displayName = $STR_MRH_MRHMiscItems_scannerForceScanEyesAttr; // Name assigned to UI control class Title
                    tooltip = $STR_MRH_MRHMiscItems_scannerForceScanEyesAttrToolTip; // Tooltip assigned to UI control class Title
                    property = "MRH_BS_forceUseyeScanner"; // Unique config property name saved in SQM
                    control = "CHECkBOX"; // UI control base class displayed in Edit Attributes window, points to Cfg3DEN >> Attributes
                    expression = "_this setVariable ['MRH_BS_MustScanEyes',_value,true]";
                    defaultValue = "false";
                    unique = 0; // When 1, only one entity of the type can have the value in the mission (used for example for variable names or player control)
                    validate = "none"; // Validate the value before saving. Can be "none", "expression", "condition", "number" or "variable"
                    condition = "object"; // Condition for attribute to appear (see the table below)
                    typeName = "BOOL"; // Defines data type of saved value, can be STRING, NUMBER or BOOL. Used only when control is "Combo", "Edit" or their variants
                };
                class forceUseHand
                {
                    //--- Mandatory properties
                    displayName = $STR_MRH_MRHMiscItems_scannerForceHandScanAttr; // Name assigned to UI control class Title
                    tooltip = $STR_MRH_MRHMiscItems_scannerForceHandScanAttrToolTip; // Tooltip assigned to UI control class Title
                    property = "MRH_BS_forceUsHandScanner"; // Unique config property name saved in SQM
                    control = "CHECkBOX"; // UI control base class displayed in Edit Attributes window, points to Cfg3DEN >> Attributes
                    expression = "_this setVariable ['MRH_BS_MustScanHand',_value,true]";
                    defaultValue = "false";
                    unique = 0; // When 1, only one entity of the type can have the value in the mission (used for example for variable names or player control)
                    validate = "none"; // Validate the value before saving. Can be "none", "expression", "condition", "number" or "variable"
                    condition = "object"; // Condition for attribute to appear (see the table below)
                    typeName = "BOOL"; // Defines data type of saved value, can be STRING, NUMBER or BOOL. Used only when control is "Combo", "Edit" or their variants
                };

                class canBeHacked
                {
                    //--- Mandatory properties
                    displayName = $STR_MRH_MRHMiscItems_scannerAllowHackingAttr; // Name assigned to UI control class Title
                    tooltip = $STR_MRH_MRHMiscItems_scannerAllowHackingAttrToolTip; // Tooltip assigned to UI control class Title
                    property = "MRH_BS_AllowHacking"; // Unique config property name saved in SQM
                    control = "CHECkBOX"; // UI control base class displayed in Edit Attributes window, points to Cfg3DEN >> Attributes
                    expression = "[_this] spawn MRH_fnc_MilsimTools_MiscItems_scannerCanBeHackedInit";
                    defaultValue = "false";
                    unique = 0; // When 1, only one entity of the type can have the value in the mission (used for example for variable names or player control)
                    validate = "none"; // Validate the value before saving. Can be "none", "expression", "condition", "number" or "variable"
                    condition = "object"; // Condition for attribute to appear (see the table below)
                    typeName = "BOOL"; // Defines data type of saved value, can be STRING, NUMBER or BOOL. Used only when control is "Combo", "Edit" or their variants
                };
		};
};
