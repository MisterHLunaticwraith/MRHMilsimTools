#include "defines.hpp"
class MRHZeusCBPS
{
	idd=220419;
   
	movingenable=true;
    onUnLoad = "((findDisplay 220419) getVariable ['MRH_ZeusModules_displayparams',[objNull,objNull]]) params ['_logic','_unit']; deleteVehicle _logic;";
	class controls 
	{////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Xasife)
////////////////////////////////////////////////////////

class MRHBack: IGUIBackMRH_RHS_CBPS
{
	idc = 2200;
	moving = true;
	x = 0.407187 * safezoneW + safezoneX;
	y = 0.368 * safezoneH + safezoneY;
	w = 0.170156 * safezoneW;
	h = 0.22 * safezoneH;
};
class MRHInfoText: RscTextMRH_RHS_CBPS
{
	idc = 1000;
	moving = true;
	text = $STR_MRH_MRH_RHS_CBPS_ZeusMenuTitleCBPS; //--- ToDo: Localize;
	x = 0.407187 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.216563 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHDepCheck: RscCheckboxMRH_RHS_CBPS
{
	idc = 2800;
	moving = true;
	x = 0.463906 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHDeployCBPStext: RscTextMRH_RHS_CBPS
{
	idc = 1001;
	moving = true;
	text = $STR_MRH_MRH_RHS_CBPS_ZeusModuleNameDeploy; //--- ToDo: Localize;
	x = 0.407187 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHCompositionText: RscTextMRH_RHS_CBPS
{
	idc = 1002;
	moving = true;
	text = $STR_MRH_MRH_RHS_CBPS_ZeusMenuCompToUse; //--- ToDo: Localize;
	x = 0.407187 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.149531 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHCompToUseCmb: RscComboMRH_RHS_CBPS
{
	idc = 2100;
	moving = true;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.149531 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHCancel: RscButtonMRH_RHS_CBPS
{
	idc = 1600;
	moving = true;
	text = $STR_MRH_MRH_RHS_CBPS_ZeusMenuCancel; //--- ToDo: Localize;
	action = "closeDialog 0";
	x = 0.443281 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class MRHApply: RscButtonMRH_RHS_CBPS
{
	idc = 1601;
	moving = true;
	action = "call MRH_fnc_MilsimTools_RHS_CBPS_deployCBPSModuleAction;";
	text = $STR_MRH_MRH_RHS_CBPS_ZeusMenuApply; //--- ToDo: Localize;
	x = 0.5 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};