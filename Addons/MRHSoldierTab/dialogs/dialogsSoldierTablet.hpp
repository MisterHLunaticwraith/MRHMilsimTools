#include "MRH_C_Path.hpp"
#define MVT moving = true
#define TXT_HH text = "<br/>hours"
#define TXT_MM text = "<br/>mnts"
#define TXT_SS text = "<br/>scnds"
#define EDT_HH text = "HH"
#define EDT_MM text = "MM"
#define EDT_SS text = "SS"
#define TXT_ST text = "Start"
#define TXT_SP text = "Stop"
#define TEXT_RST text = "Reset"
#define CB colorBackground[] = {0, 0, 0, 0.2}
#define CBB colorBackground[] = {0, 0, 0, 0.5}
#define CBT colorBackground[] = {0, 0, 0, 0}
#define FS show = false
class MRHSoldierTablet
{
	idd=03062018;
	movingenable=true;
	
	class controls 
	{

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Zizoqu)
////////////////////////////////////////////////////////

class MRHTabBackGrd: RscPictureMRHSoldierTab //neverhide
{
	idc = 1200;
	MVT;
	text = PAAPATH(tablet.paa);
	x = 0.164844 * safezoneW + safezoneX;
	y = -0.105 * safezoneH + safezoneY;
	w = 0.644531 * safezoneW;
	h = 1.276 * safezoneH;
};
class MRHIconBar: RscListboxMRHSoldierTab //neverhide
{
	idc = 1500;
	MVT;
	onLBSelChanged = "call MRH_fnc_MilsimTools_SoldierTab_TabHub;";
	rowHeight = (0.0360937 * safezoneW)/1.7
	x = 0.242187 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.020625 * safezoneW;
	h = 0.506 * safezoneH;
};
class MRHHomeButton: RscInvisibleButtonMRHSoldierTab //neverhide
{
	idc = 1600;
	MVT;
	action = "call MRH_fnc_MilsimTools_SoldierTab_RefreshHomePage;";
	x = 0.278281 * safezoneW + safezoneX;
	y = 0.753 * safezoneH + safezoneY;
	w = 0.020625 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHCloseButton: RscInvisibleButtonMRHSoldierTab //neverhide
{
	idc = 1601;
	MVT;
	action = "closedialog 0";
	x = 0.742344 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.020625 * safezoneW;
	h = 0.055 * safezoneH;
};
class MRHUpButton: RscInvisibleButtonMRHSoldierTab //neverhide
{
	idc = 1602;
	MVT;
	x = 0.742344 * safezoneW + safezoneX;
	y = 0.577 * safezoneH + safezoneY;
	w = 0.0154688 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHDownButton: RscInvisibleButtonMRHSoldierTab //neverhide
{
	idc = 1603;
	MVT;
	x = 0.742344 * safezoneW + safezoneX;
	y = 0.621 * safezoneH + safezoneY;
	w = 0.0154688 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHTimeDisplayZone: RscStructuredTextMRHSoldierTab //neverhide
{
	idc = 1201;
	MVT;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.608281 * safezoneW + safezoneX;
	y = 0.753 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.022 * safezoneH;
};
////////////////////////////////////////////////////////
// CTRLS for screen 1 (homepage)
////////////////////////////////////////////////////////

class MRHScr1CamDisp: RscPictureMRHSoldierTab
{
	idc = 1202;
	MVT;
	show = false;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.536093 * safezoneW + safezoneX;
	y = 0.269 * safezoneH + safezoneY;
	w = 0.175313 * safezoneW;
	h = 0.209 * safezoneH;
};
class MRHScr1CtrlGrp1 :RscControlsGroupMRHSoldierTab
{
	idc = 9903;
	MVT;
	show = false;
	x = 0.267969 * safezoneW + safezoneX;
	y = 0.258 * safezoneH + safezoneY;
	w = 0.262969 * safezoneW;
	h = 0.484 * safezoneH;

	class controls 
	{
		class MRHScr1TextZone: RscStructuredTextMRHSoldierTab
		{
			idc = 1203;
			MVT;
			show = false;
			colorBackground[] = {0, 0, 0, 0.2};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0;
			y = 0;
			w = 0.262969 * safezoneW;
			h = 0.484 * safezoneH;
			
		};
	};		
};
class MRHScr1CtrlGrp2 :RscControlsGroupMRHSoldierTab
{
	idc = 9904;
	MVT;
	show = false;
	x = 0.536979 * safezoneW + safezoneX;
	y = 0.487963 * safezoneH + safezoneY;
	w = 0.175313 * safezoneW;
	h = 0.253 * safezoneH;

	class controls 
	{
		class MRHScr1PlayerGrpIntel: RscStructuredTextMRHSoldierTab
		{
			idc = 1204;
			MVT;
			colorBackground[] = {0, 0, 0, 0.2};
			show = false;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0;
			y = 0;
			w = 0.175313 * safezoneW;
			h = 0.253 * safezoneH;
		};
	};		
};
///////////////////////////////////////////////////////
//ctrls for team roster
////////////////////////////////////////////////////
class MRHScrRstCtrlGrp1 :RscControlsGroupMRHSoldierTab
{
	idc = 9910;
	MVT;
	show = false;
	x = 0.267969 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.443438 * safezoneW;
	h = 0.495 * safezoneH;

	class controls 
	{
		class MRHScr1PlayerGrpIntel: RscStructuredTextMRHSoldierTab
		{
			idc = 1210;
			MVT;
			colorBackground[] = {0, 0, 0, 0.2};
			show = false;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0;
			y = 0;
			w = 0.443438 * safezoneW;
			h = 0.495 * safezoneH;
		};
	};		
};
////////////////////////////////////////////////////////
// CTRLS for screen 2 (map)
////////////////////////////////////////////////////////
class MRHScr2FullMapZone: RscMapControlMRHSoldierTab
{
	idc = 1205;
	MVT;
	show = false;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.267969 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.443438 * safezoneW;
	h = 0.495 * safezoneH;

};
////////////////////////////////////////////////////////
// CTRLS for screen 3 (pictures)
////////////////////////////////////////////////////////
class MRHScr3LisboxPicturesList: RscListboxMRHSoldierTab
{
	idc = 1206;
	MVT;
	show = false;
	onLBSelChanged = "call MRH_fnc_MilsimTools_SoldierTab_PictureChange;";
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.267969 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.0773437 * safezoneW;
	h = 0.495 * safezoneH;
	rowHeight = (0.0773437 * safezoneW);//org0
};
class MRHScr3FullPicZone: RscPictureMRHSoldierTab
{
	idc = 1207;
	MVT;
	show = false;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.345312 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.37125 * safezoneW;
	h = 0.495 * safezoneH;

};
class MRHtextzoneforpictures: RscStructuredTextMRHSoldierTab
{
	idc = 12071;
	MVT;
	show = false;
	colorBackground[] = {0, 0, 0, 0.2};
	text = "";
	x = 0.345312 * safezoneW + safezoneX;
	y = 0.709 * safezoneH + safezoneY;
	w = 0.37125 * safezoneW;
	h = 0.033 * safezoneH;
};
////////////////////////////////////////////////////////
// CTRLS for screen 4 (data)
////////////////////////////////////////////////////////
class MRHScr4TreeView: RscTreeMRHSoldierTab
{
	idc = 1208;
	MVT;
	show = false;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	onTreeSelChanged = "call MRH_fnc_MilsimTools_SoldierTab_onTvCurSelChanged;"
	x = 0.267969 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.495 * safezoneH;

};
class CtrlGrpDataTextZone : RscControlsGroupMRHSoldierTab
{
			idc = 9909;
			MVT;
			show = false;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.324844 * safezoneW;
			h = 0.495 * safezoneH;
	class controls
	{
			class MRHScr4TextZone: RscStructuredTextMRHSoldierTab
		{
			idc = 1209;
			MVT;
			show = false;
			text = "";
			colorBackground[] = {0, 0, 0, 0.2};
			x = 0;
			y = 0;
			w = 0.324844 * safezoneW;
			h = 0.495 * safezoneH;
		};	
	};
};
/////////////////////////////////////
// timerpage ctrls
////////////////////////
#include "dialogsSoldierTabletAlarmScreen.hpp"
/////////////////////////////////////
// filesharing ctrls
////////////////////////
#include "dialogsSoldierTabDataTransfer.hpp"
/////////////////////////////////////
// screen overlay
////////////////////////
class MRHScrOverLay: RscPictureMRHSoldierTab //neverhide
{
	idc = 1277;
	MVT;
	text = PAAPATH(screenoverlay.paa);
	x = 0.164844 * safezoneW + safezoneX;
	y = -0.105 * safezoneH + safezoneY;
	w = 0.644531 * safezoneW;
	h = 1.276 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
