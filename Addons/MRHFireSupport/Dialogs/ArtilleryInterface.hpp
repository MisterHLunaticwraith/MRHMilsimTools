#include "defines.hpp"
class MRHArtilleryInterface
{
	idd=200718;
	movingenable=true;
	
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Zefogy)
////////////////////////////////////////////////////////

class MRHGuiBack: IGUIBackMRHFireSupport
{
	idc = 2200;
	moving = true;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.401 * safezoneH + safezoneY;
	w = 0.23 * safezoneW; //org w = 0.211406 * safezoneW;
	h = 0.231 * safezoneH;
};
class MRHTitle: RscStructuredTextMRHFireSupport
{
	idc = 1100;
	moving = true;
	text = $STR_MRH_FireSupport_RequestArtySupport; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.401 * safezoneH + safezoneY;
	w = 0.201094 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHTipCoord: RscStructuredTextMRHFireSupport
{
	idc = 1101;
	moving = true;
	text = $STR_MRH_FireSupport_EnterGridInfo; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.159844 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHFridInpuitZone: RscEditMRHFireSupport
{
	idc = 1400;
	moving = true;
	tooltip = $STR_MRH_FireSupport_CoordToolTip;
	text = "00000-00000"; //--- ToDo: Localize;
	onChar = "call MRH_fnc_MilsimTools_FireSupport_onCharCheck;";
	onKeyDown = "if ((_this select 1)==14)ExitWith {call MRH_fnc_MilsimTools_FireSupport_onCharCheck;};";
	x = 0.556719 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHTipNumber: RscStructuredTextMRHFireSupport
{
	idc = 1102;
	moving = true;
	text = $STR_MRH_FireSupport_AvailableShotsInfo; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.159844 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHNumberOfShots: RscStructuredTextMRHFireSupport
{
	idc = 1103;
	moving = true;
	text = "00"; //--- ToDo: Localize;
	x = 0.556719 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHSelectNumberTip: RscStructuredTextMRHFireSupport
{
	idc = 1104;
	moving = true;
	text = $STR_MRH_FireSupport_SelectNumberOfShotsInfo; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.159844 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHComboNumberOfRounds: RscComboMRHFireSupport
{
	idc = 2100;
	moving = true;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.159844 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHSelectAmunitionTooltip: RscStructuredTextMRHFireSupport
{
	idc = 1105;
	moving = true;
	text = $STR_MRH_FireSupport_SelectAmmoTypeInfo; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY;
	w = 0.159844 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHSelectAmmoTypeCombo: RscComboMRHFireSupport
{
	idc = 2101;
	moving = true;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.159844 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHButtonCancel: RscButtonMRHFireSupport
{
	idc = 1600;
	moving = true;
	action = "closedialog 0";
	text = $STR_MRH_FireSupport_CancelButtonText; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHButtonfire: RscButtonMRHFireSupport
{
	idc = 1601;
	moving = true;
	text = $STR_MRH_FireSupport_FireButtonText; //--- ToDo: Localize;
	action = "[] spawn MRH_fnc_MilsimTools_FireSupport_FireArty";
	x = 0.453594 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.044 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};