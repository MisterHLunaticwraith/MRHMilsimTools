//#include "defines.hpp"

class MRHZeusSimpleConv
{
	idd=11011982;
    onUnload = "";
	movingenable=true;
	
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Hykuga)
////////////////////////////////////////////////////////

class MRHBack: IGUIBackMRHZeusModules
{
	idc = 2200;
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.225 * safezoneH + safezoneY;
	w = 0.4125 * safezoneW;
	h = 0.55 * safezoneH;
};
class MRHTitle: RscTextMRHZeusModules
{
	idc = 1001;
	text = $STR_MRH_MRHMRHZeusModules_SIMPLEACECONVADD; //--- ToDo: Localize;
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.236 * safezoneH + safezoneY;
	w = 0.180469 * safezoneW;
	h = 0.033 * safezoneH;
};
class MrhName: RscTextMRHZeusModules
{
	idc = 1000;
	text = $STR_MRH_MRHMRHZeusModules_NAMEFIELD; //--- ToDo: Localize;
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.269 * safezoneH + safezoneY;
	w = 0.139219 * safezoneW;
	h = 0.055 * safezoneH;
};
class RscPicture_1200: RscPictureMRHZeusModules
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.603125 * safezoneW + safezoneX;
	y = 0.236 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.165 * safezoneH;
};
class MRHMessTitle: RscTextMRHZeusModules
{
	idc = 1002;
	text = $STR_MRH_MRHMRHZeusModules_MSGTODIS; //--- ToDo: Localize;
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.368 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.044 * safezoneH;
};
class RscEdit_1400: RscEditMRHZeusModules
{
	idc = 1400;
	style = ST_MULTI;
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.391875 * safezoneW;
	h = 0.297 * safezoneH;
};
class MRHRemoveTitle: RscTextMRHZeusModules
{
	idc = 1003;
	text = $STR_MRH_MRHMRHZeusModules_RMVCONUSE; //--- ToDo: Localize;
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.324 * safezoneH + safezoneY;
	w = 0.139219 * safezoneW;
	h = 0.044 * safezoneH;
};
class RscCheckbox_2800: RscCheckboxMRHZeusModules
{
	idc = 2800;
	x = 0.4175 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHApplyButton: RscButtonMRHZeusModules
{
	idc = 1600;
	text = $STR_MRH_MRHMRHZeusModules_GENAPPLY; //--- ToDo: Localize;
	action = "call MRH_fnc_MilsimTools_ZeusModules_simpleConvModuleAction";
	x = 0.618594 * safezoneW + safezoneX;
	y = 0.709 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.055 * safezoneH;
};
class MRHCancelButton: RscButtonMRHZeusModules
{
	idc = 1601;
	text = $STR_MRH_MRHMRHZeusModules_GENCANCEL; //--- ToDo: Localize;
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.709 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.055 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};