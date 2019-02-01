#include "defines.hpp"
class MRHDebugHintBox
{
	idd=290119;
    onLoad = "uiNamespace setVariable ['MRHDebugHintBox', _this select 0]";
	duration = "99999999";
	
	
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Cezike)
////////////////////////////////////////////////////////

class MRHBack: IGUIBackMRHDebugTools
{
	idc = 2200;
	x = 0.694999 * safezoneW + safezoneX;
	y = 0.904 * safezoneH + safezoneY;
	w = 0.3 * safezoneW;
	h = 0.08 * safezoneH;
};
class MRHDebugText: RscTextMRHDebugTools
{
	idc = 1234;
	text = $STR_MRH_MRHDebugTools_DBGWARN; //--- ToDo: Localize;
    style = ST_MULTI;
	x = 0.695937 * safezoneW + safezoneX;
	y = 0.896 * safezoneH + safezoneY;
	w = 0.299062 * safezoneW;
	h = 0.088 * safezoneH;
};
class MRHFrame: RscFrameMRHDebugTools
{
	idc = 1800;
	text = $STR_MRH_MRHDebugTools_LATESTREPORTCOL; //--- ToDo: Localize;
	x = 0.695937 * safezoneW + safezoneX;
	y = 0.885 * safezoneH + safezoneY;
	w = 0.299062 * safezoneW;
	h = 0.099 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};