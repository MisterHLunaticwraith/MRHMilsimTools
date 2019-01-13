#include "definesMRHconv.hpp"
class MRHConvSystem
{	
	idd=8888;
	movingenable=true;
	onUnload = "_cam = (_this select 0) getVariable 'MRH_convSystemCreatedCam';camDestroy _cam;_unit = (_this select 0) getVariable 'MRH_convSystemTalkingUnit'; _unit setRandomLip false;";
	class controls 
	{

class MRHDialogFond: RscPictureMRHconvsystem
{
	idc = 11111;
	text = "\MRHFunctions\img\conversationUI.paa";
	x = 0.231875 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.515625 * safezoneW;
	h = 0.132 * safezoneH;
};
class MRHDialogexitbutton: RscButtonMRHconvsystem
{
	idc = 11112;
	text = $STR_MRH_FC_DIALOGCLOSE; //--- ToDo: Localize;
	x = 0.707292 * safezoneW + safezoneX;
	y = 0.579667 * safezoneH + safezoneY;
	w = 0.0351041 * safezoneW;
	h = 0.0688889 * safezoneH;
	action = "closedialog 0;";
};
class MRHCTRLGRP: RscControlsGroupMRHconvsystem
{
	idc = 11113;
	text = "dummytext"; //--- ToDo: Localize;
	x = 0.33125 * safezoneW + safezoneX;
	y = 0.581482 * safezoneH + safezoneY;
	w = 0.371823 * safezoneW;
	h = 0.0645926 * safezoneH;
	class Controls
	{
	class MRHDialogtext: RscStructuredTextMRHconvsystem
{
	idc = 11114;
	x = 0;
	y = 0;
	w = 0.371823 * safezoneW;
	h = 0.0645926 * safezoneH;
};	
	};
};



class MRHPIPPicture: RscPictureMRHconvsystem
{
	idc = 11116;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.253437 * safezoneW + safezoneX;
	y = 0.571445 * safezoneH + safezoneY;
	w = 0.0386979 * safezoneW;
	h = 0.0669259 * safezoneH;
};

class MRHNameText: RscStructuredTextMRHconvsystem
{
	idc = 11115;
	show = false;
	x = 0.093125 * safezoneW + safezoneX;
	y = 0.92 * safezoneH + safezoneY;
	w = 0.065625 * safezoneW;
	h = 0.042 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};