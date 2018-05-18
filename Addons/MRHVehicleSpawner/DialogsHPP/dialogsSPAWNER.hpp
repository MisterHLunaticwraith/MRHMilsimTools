////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Wataty)
////////////////////////////////////////////////////////
class MRHSpawner
{
	idd=2121;
	movingenable=false;
	
	class controls 
	{

class MRHSpawnerLaptop: RscPictureMRHSpawner
{
	idc = 1200;
	text = "\MRHVehicleSpawner\paa\laptop.paa";
	x = 0.00125001 * safezoneW + safezoneX;
	y = -0.00399999 * safezoneH + safezoneY;
	w = 0.9975 * safezoneW;
	h = 1.008 * safezoneH;
};

class MRHSpawnButton: RscButtonMRHSpawner
{
	idc = 1600;
	text = $STR_MRH_SPAWNER_SPAWNBUTTON;
	x = 0.677188 * safezoneW + safezoneX;
	y = 0.528 * safezoneH + safezoneY;
	w = 0.0525 * safezoneW;
	h = 0.042 * safezoneH;
	action = "call MRH_fnc_Spawner_Spawn";
};
class MRHquitter: RscButtonMRHSpawner
{
	idc = 1601;
	text = $STR_MRH_SPAWNER_CLOSEBUTTON;
	x = 0.677188 * safezoneW + safezoneX;
	y = 0.57 * safezoneH + safezoneY;
	w = 0.0525 * safezoneW;
	h = 0.042 * safezoneH;
	action = "closedialog 0";
};
class MRHPreview: RscPictureMRHSpawner
{
	idc = 1201;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.5525 * safezoneW + safezoneX;
	y = 0.276 * safezoneH + safezoneY;
	w = 0.164062 * safezoneW;
	h = 0.21 * safezoneH;
};
class MRHCTRLGRP: RscControlsGroupMRHSpawner
{
	idc = 2301;
	x = 0.244062 * safezoneW + safezoneX;
	y = 0.206 * safezoneH + safezoneY;
	w = 0.295312 * safezoneW;
	h = 0.378 * safezoneH;
	class Controls
	{
		class MRHlist: RscListboxMRHSpawner
{
	idc = 1500;
	x = 0;
	y = 0;
	w = 0.295312 * safezoneW;
	h = 0.378 * safezoneH;
	onMouseButtonClick = "call MRH_fnc_Spawner_Refresh";
};
	};
};

class MRHName: RscStructuredTextMRHSpawner
{
	idc = 1100;
	text = ""; //--- ToDo: Localize;
	x = 0.5525 * safezoneW + safezoneX;
	y = 0.234 * safezoneH + safezoneY;
	w = 0.164062 * safezoneW;
	h = 0.028 * safezoneH;
};

class MRHIcon: RscPictureMRHSpawner
{
	idc = 1203;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.605 * safezoneW + safezoneX;
	y = 0.15 * safezoneH + safezoneY;
	w = 0.0525 * safezoneW;
	h = 0.07 * safezoneH;
};
class MRHCatergorycchoice: RscComboMRHSpawner
{
	idc = 2100;
	text = ""; //--- ToDo: Localize;
	x = 0.26375 * safezoneW + safezoneX;
	y = 0.15 * safezoneH + safezoneY;
	w = 0.275625 * safezoneW;
	h = 0.028 * safezoneH;
	onLBSelChanged = "_MRHvalue = _this select 1; [_MRHvalue] call MRH_fnc_Spawner_SelectType;";
};
class MRHDLCSelect: RscComboMRHSpawner
{
	idc = 2101;
	x = 0.5525 * safezoneW + safezoneX;
	y = 0.528 * safezoneH + safezoneY;
	w = 0.124687 * safezoneW;
	h = 0.028 * safezoneH;
	tooltip = $STR_MRH_SPAWNER_SELECTMODTOOLTIP;
	onLBSelChanged = "_MRHvalue = _this select 1; [_MRHvalue] call MRH_fnc_Spawner_UserSelectedDLC;";
};
class MRHFactionSelect: RscComboMRHSpawner
{
	idc = 2102;
	x = 0.5525 * safezoneW + safezoneX;
	y = 0.57 * safezoneH + safezoneY;
	w = 0.124687 * safezoneW;
	h = 0.028 * safezoneH;
	tooltip = $STR_MRH_SPAWNER_SELECTFACTIONTOOLTIP; //--- ToDo: Localize;
	onLBSelChanged = "_MRHvalue = _this select 1; [_MRHvalue] call MRH_fnc_UserSelectedFaction;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};