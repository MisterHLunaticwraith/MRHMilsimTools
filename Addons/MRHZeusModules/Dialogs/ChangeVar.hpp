class MRHChangeVarNameDialog
{
	idd=14012019;
    onUnload = "";
	movingenable=true;
	
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Kebace)
////////////////////////////////////////////////////////

class MRHBack: IGUIBackMRHZeusModules
{
	idc = 2200;
	x = 0.365937 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.273281 * safezoneW;
	h = 0.33 * safezoneH;
};
class MRHMenuTitle: RscTextMRHZeusModules
{
	idc = 1000;
	text = $STR_MRH_MRHMRHZeusModules_AttVarToOBJ; //--- ToDo: Localize;
	x = 0.37625 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.128906 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHCurrentObjVarNameTitle: RscTextMRHZeusModules
{
	idc = 1001;
	text = $STR_MRH_MRHMRHZeusModules_CurrentObjVName; //--- ToDo: Localize;
	x = 0.381406 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHCurrentObjVarNameField: RscTextMRHZeusModules
{
	idc = 1002;
	text = "dummytext"; //--- ToDo: Localize;
	x = 0.494844 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHCurrentObjTypeTitle: RscTextMRHZeusModules
{
	idc = 1003;
	text = $STR_MRH_MRHMRHZeusModules_CurrentObjClass; //--- ToDo: Localize;
	x = 0.381406 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHCurrentObjTypeField: RscTextMRHZeusModules
{
	idc = 1004;
	text = "dummytext2"; //--- ToDo: Localize;
	x = 0.494844 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHEnterDesiredNameTitle: RscTextMRHZeusModules
{
	idc = 1005;
	text = $STR_MRH_MRHMRHZeusModules_InputDesiredVar; //--- ToDo: Localize;
	x = 0.381406 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.033 * safezoneH;
};
class RscEdit_1400: RscEditMRHZeusModules
{
	idc = 1400;
    onChar = "[_this,MRH_fnc_MilsimTools_Core_isExistingVariableName,true] call MRH_fnc_MilsimTools_ZeusModules_onCharCheck;";
	onKeyDown = "if ((_this select 1)==14)ExitWith {[_this,MRH_fnc_MilsimTools_Core_isExistingVariableName,true] call MRH_fnc_MilsimTools_ZeusModules_onCharCheck;};";
	x = 0.381406 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.170156 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHObjectEditorPreview: RscPictureMRHZeusModules
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.121 * safezoneH;
};
class MRHButtonCancel: RscButtonMRHZeusModules
{
	idc = 1600;
	text = $STR_MRH_MRHMRHZeusModules_GENCANCEL; //--- ToDo: Localize;
    action = "closedialog 0";
	x = 0.572187 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.055 * safezoneH;
};
class MRHButtonOk: RscButtonMRHZeusModules
{
	idc = 1601;
	text = $STR_MRH_MRHMRHZeusModules_GENOK; //--- ToDo: Localize;
    action = "call MRH_fnc_MilsimTools_ZeusModules_attributeVariableNameModuleAction";
	x = 0.505156 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.055 * safezoneH;
};
class MRHWarning: RscStructuredTextMRHZeusModules
{
	idc = 1100;
	text = $STR_MRH_MRHMRHZeusModules_RedWarning; //--- ToDo: Localize;
	x = 0.37625 * safezoneW + safezoneX;
	y = 0.368 * safezoneH + safezoneY;
	w = 0.165 * safezoneW;
	h = 0.088 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};