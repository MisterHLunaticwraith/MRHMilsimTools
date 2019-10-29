#include "videoChoiceDefines.hpp"
class MRHVideoChoice
{
	idd=241019;
	movingenable=true;

	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Bivyfi)
////////////////////////////////////////////////////////

class MRH_BackUi: IGUIBackMRHVideoChoice
{
	idc = 2200;
	moving = true;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.211406 * safezoneW;
	h = 0.088 * safezoneH;
};
class MRH_Title: RscStructuredTextMRHVideoChoice
{
	idc = 1100;
	moving = true;
	text = $STR_MRH_ST_selectVidToPlay; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.185625 * safezoneW;
	h = 0.022 * safezoneH;
};
class RscCombo_2100: RscComboMRHVideoChoice
{
	idc = 2100;
	moving = true;
	onload = "private _list = _this select 0; _index = _list lbAdd 'Stop video'; _list lbsetData [_index,''];{private _index = _list lbAdd _x; _list lbSetData [_index,_x]} forEach ([(['MRH_MilsimTools_ST_BriefingRemote_videosToPlay'] call cba_settings_fnc_get)] call MRH_fnc_MilsimTools_Core_stringListToArray); _list lbSetCurSel 0;";
	onLBSelChanged = "private _list = (_this select 0); private _video = _list lbData (lbCurSel _list); hint _video;private _ctrlPreview = (ctrlParent _list) displayCtrl 1200;missionNamespace setVariable ['MRH_stop_vid', true];missionNamespace setVariable ['MRH_stop_vid',nil];; _ctrlPreview ctrlSetText _video; [_video, [10, 10],[1,1,1,1],'MRH_stop_vid'] call BIS_fnc_playVideo;";
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.456 * safezoneH + safezoneY;
	w = 0.159844 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRH_CancelButton: RscButtonMRHVideoChoice
{
	idc = 1600;
	moving = true;
	text = $STR_MRH_ST_cancel; //--- ToDo: Localize;
	action = "closedialog 0";
	x = 0.443281 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.0464063 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRH_playVidButton: RscButtonMRHVideoChoice
{
	idc = 1601;
	moving = true;
	text = $STR_MRH_ST_playVid; //--- ToDo: Localize;
	action = "private _list = (findDisplay 241019)displayCtrl 2100;private _video = _list lbData (lbCurSel _list);private _screens = (findDisplay 241019) getVariable ['MRH_Brief_screens',[]];[_video,_screens] call MRH_fnc_MilsimTools_SoldierTab_playVideoOnScreens;closeDialog 0;"
	x = 0.396875 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.0464063 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRH_VideoIcon: RscPictureMRHVideoChoice
{
	idc = 1200;
	moving = true;
	text = "\MRHMarkers\paa\start.paa";
	x = 0.551562 * safezoneW + safezoneX;
	y = 0.456 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
