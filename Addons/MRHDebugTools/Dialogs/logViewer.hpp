#include "defines.hpp"
class MRHLogViewer
{
	idd=300119;
    onLoad = "";

	
	
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Tegysy)
////////////////////////////////////////////////////////

class MRHBack: IGUIBackMRHDebugTools
{
	idc = 2200;
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.00500003 * safezoneH + safezoneY;
	w = 0.4125 * safezoneW;
	h = 1.001 * safezoneH;
};
class MRHLogTitle: RscTextMRHDebugTools
{
	idc = 1000;
	text = $STR_MRH_MRHDebugTools_DEBUGLOGTITTLE; //--- ToDo: Localize;
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.016 * safezoneH + safezoneY;
	w = 0.366094 * safezoneW;
	h = 0.022 * safezoneH;
};
class RscControlsGroup_2300: RscControlsGroupMRHDebugTools
{
	idc = 2300;
	x = 0.298906 * safezoneW + safezoneX;
    y = 0.049 * safezoneH + safezoneY;
    w = 0.397031 * safezoneW;
    h = 0.891 * safezoneH;

	class Controls
    {
            class MRHLogText: RscStructuredTextMRHDebugTools
            {
                idc = 1100;
                x = 0;
                y = 0;
                w = 0.397031 * safezoneW;
                h = 0.891 * safezoneH;
            };
	};
};
class MRHCloseButton: RscButtonMRHDebugTools
{
	idc = 1600;
    action = "closedialog 0";
	text = $STR_MRH_MRHDebugTools_CLOSEBUTT; //--- ToDo: Localize;
	x = 0.304062 * safezoneW + safezoneX;
	y = 0.951 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHCopyButton: RscButtonMRHDebugTools
{
	idc = 1601;
	text = $STR_MRH_MRHDebugTools_COPYTOCLIPBOARDLOG; //--- ToDo: Localize;
    action = "call MRH_fnc_MilsimTools_DebugTools_logToClipboard;";
	x = 0.572187 * safezoneW + safezoneX;
	y = 0.951 * safezoneH + safezoneY;
	w = 0.118594 * safezoneW;
	h = 0.033 * safezoneH;
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
    };
};