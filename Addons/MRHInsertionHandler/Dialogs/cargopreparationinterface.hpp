
#include "MRH_C_Path.hpp"
class MRHCargoPrepareInterface
{
	idd=17082018;
	movingenable=true;
	
	class controls 
	{

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Lymexe)
////////////////////////////////////////////////////////


////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Xycive)
////////////////////////////////////////////////////////

class MRHGUIBack: IGUIBackMRHInsertionInterface
{
	idc = 2200;
    moving = true;
    x = 0.335 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.340312 * safezoneW;
	h = 0.264 * safezoneH;
    /*
	x = 0.335 * safezoneW + safezoneX;
	y = 0.324 * safezoneH + safezoneY;
	w = 0.340312 * safezoneW;
	h = 0.253 * safezoneH;
    */
};
class MRHFrame: RscFrameMRHInsertionInterface
{
	idc = 1800;
    moving = true;
	text = $STR_MRH_MRHInsertionHandler_PrepCarGoloadinterfTitle; //--- ToDo: Localize;
    sizeEx = 20;
	x = 0.335 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.340312 * safezoneW;
	h = 0.264 * safezoneH;
};
class MRHObjectPreviewPic: RscPictureMRHInsertionInterface
{
	idc = 1200;
    moving = true;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.587656 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.121 * safezoneH;
};
class MRHInfoText: RscStructuredTextMRHInsertionInterface
{
	idc = 1100;
    moving = true;
	text = $STR_MRH_MRHInsertionHandler_PrepareCGinfotext; //--- ToDo: Localize;
	x = 0.345312 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.232031 * safezoneW;
	h = 0.066 * safezoneH;
};
class MRHDefineNameInfo: RscStructuredTextMRHInsertionInterface
{
	idc = 1101;
    moving = true;
	text = $STR_MRH_MRHInsertionHandler_defineCGnameinfotext; //--- ToDo: Localize;
	x = 0.347396 * safezoneW + safezoneX;
	y = 0.42037 * safezoneH + safezoneY;
	w = 0.226875 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHInputNameBox: RscEditMRHInsertionInterface
{
	idc = 1400;
    moving = true;
	x = 0.350469 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.221719 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHOkButton: RscButtonMRHInsertionInterface
{
	idc = 1600;
    moving = true;
	text = $STR_MRH_MRHInsertionHandler_PrepareCargo; //--- ToDo: Localize;
	x = 0.350469 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHCancelButton: RscButtonMRHInsertionInterface
{
	idc = 1601;
    moving = true;
	text = $STR_MRH_MRHInsertionHandler_Cancel; //--- ToDo: Localize;
    action = "closeDialog 0";
	x = 0.432969 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.044 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
    };
};