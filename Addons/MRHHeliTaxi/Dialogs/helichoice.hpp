#include "defines.hpp"
class MRHHeliChoice
{
	idd=160718;
	movingenable=true;
	
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Vijego)
////////////////////////////////////////////////////////

class IGUIBack_2200: IGUIBackMRHHeliTaxi
{
	idc = 2200;
	x = 0.427812 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.149531 * safezoneW;
	h = 0.143 * safezoneH;
};
class RscCombo_2100: RscComboMRHHeliTaxi
{
	idc = 2100;
	x = 0.432969 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.134062 * safezoneW;
	h = 0.022 * safezoneH;
};
class RscStructuredText_1100: RscStructuredTextMRHHeliTaxi
{
	idc = 1100;
	text = $STR_MRH_HeliTaxi_SelectHeliType; //--- ToDo: Localize;
	x = 0.427812 * safezoneW + safezoneX;
	y = 0.39 * safezoneH + safezoneY;
	w = 0.139219 * safezoneW;
	h = 0.022 * safezoneH;
};
class RscButton_1600: RscButtonMRHHeliTaxi
{
	
	idc = 1600;
	text = "OK"; //--- ToDo: Localize;
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.456 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
 };
};