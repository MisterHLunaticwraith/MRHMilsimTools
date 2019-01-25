class MRHSetSurrenderMenu
{
	idd=250119;
   
	movingenable=true;
    onUnLoad = "if ((_this select 1)==2) then {((findDisplay 250119) getVariable ['MRH_ZeusModules_displayparams',[objNull,objNull]]) params ['_logic','_unit']; deleteVehicle _logic;}";
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Qulygy)
////////////////////////////////////////////////////////

class MRHBack: IGUIBackMRHZeusModules
{
	idc = 2200;
	x = 0.360781 * safezoneW + safezoneX;
	y = 0.324 * safezoneH + safezoneY;
	w = 0.273281 * safezoneW;
	h = 0.33 * safezoneH;
};
class MRHTitle: RscTextMRHZeusModules
{
	idc = 1000;
	text = $STR_MRH_MRHMRHZeusModules_SetSurTitleCOL; //--- ToDo: Localize;
	x = 0.365625 * safezoneW + safezoneX;
	y = 0.336111 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHDistTitle: RscTextMRHZeusModules
{
	idc = 1001;
	text = $STR_MRH_MRHMRHZeusModules_DistAtWhichUnitWill; //--- ToDo: Localize;
	x = 0.365937 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.237187 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHDistanceEdit: RscEditMRHZeusModules
{
	idc = 1400;
	text = "10"; //--- ToDo: Localize;
	x = 0.587656 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHOdds: RscTextMRHZeusModules
{
	idc = 1002;
	text = $STR_MRH_MRHMRHZeusModules_OddsForSurr; //--- ToDo: Localize;
	x = 0.365937 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.170156 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHOddsEdit: RscEditMRHZeusModules
{
	idc = 1401;
	text = "100"; //--- ToDo: Localize;
	x = 0.536094 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHUnitPic: RscPictureMRHZeusModules
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.561875 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.099 * safezoneH;
};
class MRHUnitNameTitle: RscTextMRHZeusModules
{
	idc = 1003;
	text = $STR_MRH_MRHMRHZeusModules_NAMEFIELD; //--- ToDo: Localize;
	x = 0.365937 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.0464063 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHUnitNameField: RscTextMRHZeusModules
{
	idc = 1004;
	text = "Some STupid Greek Name"; //--- ToDo: Localize;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.139219 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHUnitClassTitle: RscTextMRHZeusModules
{
	idc = 1005;
	text = $STR_MRH_MRHMRHZeusModules_CurrentObjClass; //--- ToDo: Localize;
	x = 0.365937 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHUnitClassnameSTringField: RscTextMRHZeusModules
{
	idc = 1006;
	text = """CA_Man"""; //--- ToDo: Localize;
	x = 0.453594 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHHINT: RscTextMRHZeusModules
{
	idc = 1007;
	text = $STR_MRH_MRHMRHZeusModules_SurrenderModTip; //--- ToDo: Localize;
	x = 0.365937 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.262969 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHCancelButton: RscButtonMRHZeusModules
{
	idc = 1600;
    action = "((findDisplay 250119) getVariable ['MRH_ZeusModules_displayparams',[objNull,objNull]]) params ['_logic','_unit']; deleteVehicle _logic;closeDialog 0";
	text = $STR_MRH_MRHMRHZeusModules_GENCANCEL; //--- ToDo: Localize;
	x = 0.515469 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHApplyButton: RscButtonMRHZeusModules
{
	idc = 1601;
    action = "call MRH_fnc_MilsimTools_ZeusModules_setForSurrenderModuleAction";
	text = $STR_MRH_MRHMRHZeusModules_GENAPPLY; //--- ToDo: Localize;
	x = 0.572187 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHMessageTitle: RscTextMRHZeusModules
{
	idc = 1008;
	text = $STR_MRH_MRHMRHZeusModules_MessageSurrTitle; //--- ToDo: Localize;
	x = 0.365937 * safezoneW + safezoneX;
	y = 0.401 * safezoneH + safezoneY;
	w = 0.165 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHMrhSurrenderMessEdit: RscEditMRHZeusModules
{
	idc = 1402;
	text = $STR_MRH_MRHMRHZeusModules_SurrenderMessageToEdit; //--- ToDo: Localize;
	x = 0.365937 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.190781 * safezoneW;
	h = 0.033 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
    };
};