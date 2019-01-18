#include "defines.hpp"

class MRHZeusMHeliPerSide
{
	idd=11012019;
    onUnload = "";
	movingenable=true;
	
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Tehiko)
////////////////////////////////////////////////////////

class MRHHeliModuleChangeSettingsBack: IGUIBackMRHZeusModules
{
	idc = 2200;
	x = 0.37625 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.268125 * safezoneW;
	h = 0.319 * safezoneH;
};
class MRHHeliModuleChangeSettingsInfo: RscTextMRHZeusModules
{
	idc = 1000;
	text = $STR_MRH_MRHMRHZeusModules_ChangeHelisPerSide; //--- ToDo: Localize;
	x = 0.382292 * safezoneW + safezoneX;
	y = 0.364815 * safezoneH + safezoneY;
	w = 0.201094 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHHeliModuleChangeSettingsBLUFORtext: RscTextMRHZeusModules
{
	idc = 1001;
	text = $STR_MRH_MRHMRHZeusModules_GENBLUFOR; //--- ToDo: Localize;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.401 * safezoneH + safezoneY;
	w = 0.149531 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHHeliModuleChangeSettingsOPFORtext: RscTextMRHZeusModules
{
	idc = 1002;
	text = $STR_MRH_MRHMRHZeusModules_GENOPFOR; //--- ToDo: Localize;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.149531 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHHeliModuleChangeSettingsINDEtext: RscTextMRHZeusModules
{
	idc = 1003;
	text = $STR_MRH_MRHMRHZeusModules_GENINDE; //--- ToDo: Localize;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.149531 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHHeliModuleChangeSettingsCIVtext: RscTextMRHZeusModules
{
	idc = 1004;
	text = $STR_MRH_MRHMRHZeusModules_GENCIVS; //--- ToDo: Localize;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY;
	w = 0.149531 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHHeliModuleChangeSettingsBLUFOREdit: RscEditMRHZeusModules
{
	idc = 1400;
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.401 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHHeliModuleChangeSettingsOPFOREdit: RscEditMRHZeusModules
{
	idc = 1401;
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHHeliModuleChangeSettingsINDEEdit: RscEditMRHZeusModules
{
	idc = 1402;
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHHeliModuleChangeSettingsCIVSEdit: RscEditMRHZeusModules
{
	idc = 1403;
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHHeliModuleChangeSettingsCancel: RscButtonMRHZeusModules
{
	idc = 1600;
	text = $STR_MRH_MRHMRHZeusModules_GENCANCEL; //--- ToDo: Localize;
    action = "closeDialog 0";
	x = 0.463906 * safezoneW + safezoneX;
	y = 0.61 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHHeliModuleChangeSettingsApply: RscButtonMRHZeusModules
{
	idc = 1601;
	text = $STR_MRH_MRHMRHZeusModules_GENAPPLY; //--- ToDo: Localize;
	action = "call MRH_fnc_MilsimTools_ZeusModules_heliPerSideModuleAction";
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.61 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.044 * safezoneH;
};
class RscCheckbox_2800: RscCheckboxMRHZeusModules
{
	idc = 2800;
	x = 0.494844 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.020625 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHHeliModuleChangeSettingsNotifyPlText: RscTextMRHZeusModules
{
	idc = 1005;
	text = $STR_MRH_MRHMRHZeusModules_NOTPLAYSIDE; //--- ToDo: Localize;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.033 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
    };
};