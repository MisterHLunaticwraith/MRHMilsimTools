#include "HUDIntelDefines.hpp"
class MRH_HUDIntel
{
	idd= 080919;
   
	movingenable = false;
    onLoad = "uiNamespace setVariable ['MRH_HUDIntel', _this select 0]";
	duration = "9999";
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Xyfiqo)
////////////////////////////////////////////////////////

class MRHIcon: RscPictureMRHHUD
{
	idc = 1200;
	text = "\MRHMarkers\paa\medical.paa";
	x = 0.964063 * safezoneW + safezoneX;
	y = 0.676 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
};
class MRHProgress: RscProgressMRHHUD
{
	idc = 1201;
	text = "#(argb,8,8,3)color(0,1,0,1)";
	x = 0.964063 * safezoneW + safezoneX;
	y = 0.742 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.011 * safezoneH;
};
class MRHStatusText: RscStructuredTextMRHHUD
{
	idc = 1100;
	text = $STR_MRH_HeliTaxi_waitWord; //--- ToDo: Localize;
	x = 0.964063 * safezoneW + safezoneX;
	y = 0.753 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHETA: RscStructuredTextMRHHUD
{
	idc = 1101;
	text = "00:00"; //--- ToDo: Localize;
	x = 0.964063 * safezoneW + safezoneX;
	y = 0.775 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.022 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};