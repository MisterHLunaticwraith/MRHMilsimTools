#include "MRH_C_Path.hpp"
class MRHAdminMenu
{
	idd=260518;
	movingenable=true;
	
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Povily)
////////////////////////////////////////////////////////

class MRHBackGround: RscPictureMRHAdminMenu
{
	idc = 2200;
	moving = true;
	text = PAAPATH(window.paa);
	x = 0.2375 * safezoneW + safezoneX;
	y = 0.15 * safezoneH + safezoneY;
	w = 0.525 * safezoneW;
	h = 0.7 * safezoneH;
};
class MRHPlayersList: RscListboxMRHAdminMenu
{
	idc = 1500;
	moving = true;
	onLBSelChanged = "_playerUid = lbdata [1500,(lbCurSel 1500)];_player = [_playerUid] call MRH_fnc_MilsimTools_Core_FindPlayerByUID; ((findDisplay 260518) displayctrl 1601) ctrlSetText (name _player);";
	x = 0.08 * safezoneW + safezoneX;
	y = 0.15 * safezoneH + safezoneY;
	w = 0.1575 * safezoneW;
	h = 0.7 * safezoneH;
};
class MRHTabButtonGeneral: RscButtonMRHAdminMenu
{
	idc = 1600;
	moving = true;
	action = "call MRH_fnc_MilsimTools_Admin_FillMissionPage;";
	text = "Mission "; //--- ToDo: Localize;
	x = 0.2375 * safezoneW + safezoneX;
	y = 0.108 * safezoneH + safezoneY;
	w = 0.137812 * safezoneW;
	h = 0.042 * safezoneH;
};
class MRHTabPlayer: RscButtonMRHAdminMenu
{
	idc = 1601;
	moving = true;
	action = "call MRH_fnc_MilsimTools_Admin_FillPlayerPage;";
	text = "Player"; //--- ToDo: Localize;
	x = 0.375312 * safezoneW + safezoneX;
	y = 0.108 * safezoneH + safezoneY;
	w = 0.137812 * safezoneW;
	h = 0.042 * safezoneH;
};
class MRHMissionTitleText: RscStructuredTextMRHAdminMenu
{
	idc = 1100;
	moving = true;
	text = "lorem ipsum"; //--- ToDo: Localize;
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.178 * safezoneH + safezoneY;
	w = 0.223125 * safezoneW;
	h = 0.042 * safezoneH;
};
class RscControlsGroup_2300: RscControlsGroupMRHAdminMenu
{
	idc = 2300;
	moving = true;
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.234 * safezoneH + safezoneY;
	w = 0.223125 * safezoneW;
	h = 0.378 * safezoneH;
	class Controls
	{
		class MRHMissionStats: RscStructuredTextMRHAdminMenu
		{
			idc = 1101;
			moving = true;
			text = "lorem ipsum"; //--- ToDo: Localize;
			x = 0;
			y = 0;
			w = 0.223125 * safezoneW;
			h = 0.378 * safezoneH;
		};
	};
};

class MRHHealAllButton: RscButtonMRHAdminMenu
{
	idc = 1602;
	moving = true;
	action = "call MRH_fnc_MilsimTools_Admin_HealAll;";
	text = "Heal all players"; //--- ToDo: Localize;
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.626 * safezoneH + safezoneY;
	w = 0.223125 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHAllowRespawnAll: RscButtonMRHAdminMenu
{
	idc = 1603;
	moving = true;
	action = "call MRH_fnc_MilsimTools_Admin_GlobalJipOpen;";
	text = "Allow respawn for all players"; //--- ToDo: Localize;
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.668 * safezoneH + safezoneY;
	w = 0.223125 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHResetHasdiedAllButton: RscButtonMRHAdminMenu
{
	idc = 1604;
	moving = true;
	action = "call MRH_fnc_MilsimTools_Admin_SetHasDiedAll;";
	text = "Reset 'has died' variable for all players"; //--- ToDo: Localize;
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.71 * safezoneH + safezoneY;
	w = 0.223125 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHEndMissionButton: RscButtonMRHAdminMenu
{
	idc = 1605;
	moving = true;
	text = "End mission with selected ending"; //--- ToDo: Localize;
	action = "call MRH_fnc_MilsimTools_Admin_EndMission;";
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.794 * safezoneH + safezoneY;
	w = 0.223125 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHSelectEndingCombo: RscComboMRHAdminMenu
{
	idc = 2100;
	moving = true;
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.752 * safezoneH + safezoneY;
	w = 0.223125 * safezoneW;
	h = 0.028 * safezoneH;
};

class MRHRosterTitle: RscStructuredTextMRHAdminMenu
{
	idc = 1102;
	moving = true;
	text = "Team roster"; //--- ToDo: Localize;
	x = 0.480312 * safezoneW + safezoneX;
	y = 0.178 * safezoneH + safezoneY;
	w = 0.269062 * safezoneW;
	h = 0.042 * safezoneH;
};
class MRHShowAIGrpsText: RscStructuredTextMRHAdminMenu
{
	idc = 1103;
	moving = true;
	text = "Show groups comprising only AIs"; //--- ToDo: Localize;
	x = 0.506562 * safezoneW + safezoneX;
	y = 0.234 * safezoneH + safezoneY;
	w = 0.242812 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHShowAIGroupsCheck: RscCheckboxMRHAdminMenu
{
	idc = 2800;
	moving = true;
	onCheckedChanged = "call MRH_fnc_MilsimTools_Admin_ApplyRoster;";
	x = 0.47375 * safezoneW + safezoneX;
	y = 0.234 * safezoneH + safezoneY;//0.22 * safezoneH + safezoneY;
	w = 0.0328125 * safezoneW/2;
	h = 0.056 * safezoneH/2;
};
class MRHShowAIsinplayerGroups: RscStructuredTextMRHAdminMenu
{
	idc = 1104;
	moving = true;
	text = "Show AIs in groups with players"; //--- ToDo: Localize;
	x = 0.506562 * safezoneW + safezoneX;
	y = 0.276 * safezoneH + safezoneY;
	w = 0.242812 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHShowAisInGrpsCheck: RscCheckboxMRHAdminMenu
{
	idc = 2801;
	moving = true;
	onCheckedChanged = "call MRH_fnc_MilsimTools_Admin_ApplyRoster;";
	x = 0.47375 * safezoneW + safezoneX;
	y = 0.276 * safezoneH + safezoneY;//0.262 * safezoneH + safezoneY;
	w = 0.0328125 * safezoneW/2;
	h = 0.056 * safezoneH/2;
};
class MRHSelectSideToShowCombo: RscComboMRHAdminMenu
{
	idc = 2101;
	moving = true;
	onLBSelChanged = "call MRH_fnc_MilsimTools_Admin_ApplyRoster;";
	x = 0.480312 * safezoneW + safezoneX;
	y = 0.318 * safezoneH + safezoneY;
	w = 0.269062 * safezoneW;
	h = 0.028 * safezoneH;
};
class RscControlsGroup_2301: RscControlsGroupMRHAdminMenu
{
	idc = 2301;
	moving = true;
	x = 0.480312 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.269062 * safezoneW;
	h = 0.434 * safezoneH;
	class Controls
	{
		class MRHRosterTextZone: RscStructuredTextMRHAdminMenu
		{
			idc = 1105;
			moving = true;
			text = "lorem ipsum"; //--- ToDo: Localize;
			x = 0;
			y = 0;
			w = 0.269062 * safezoneW;
			h = 0.434 * safezoneH;
		};
	};
};

class MRHCloseButton: RscButtonMRHAdminMenu
{
	idc = 1606;
	moving = true;
	text = "Close"; //--- ToDo: Localize;
	action = "closedialog 0;";
	x = 0.664063 * safezoneW + safezoneX;
	y = 0.794 * safezoneH + safezoneY;
	w = 0.0853125 * safezoneW;
	h = 0.042 * safezoneH;
};
/////////////////////////TAB2Buttons
class MRHPlayerNameText: RscStructuredTextMRHAdminMenu
{
	idc = 1106;
	show = false;
	moving = true;
	text = "Player's name"; //--- ToDo: Localize;
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.178 * safezoneH + safezoneY;
	w = 0.223125 * safezoneW;
	h = 0.042 * safezoneH;

};
class RscControlsGroup_2302: RscControlsGroupMRHAdminMenu
{
	idc = 2302;
	show = false;
	moving = true;
	text = "lpsum lorem"; //--- ToDo: Localize;
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.234 * safezoneH + safezoneY;
	w = 0.223125 * safezoneW;
	h = 0.378 * safezoneH;
	class Controls
	{
		class MRHPlayerIntel: RscStructuredTextMRHAdminMenu
		{
			idc = 1107;
			show = false;
			moving = true;
			text = "lpsum lorem"; //--- ToDo: Localize;
			x = 0;
			y = 0;
			w = 0.223125 * safezoneW;
			h = 0.378 * safezoneH;

		};
	};
};

class MRHHealSelected: RscButtonMRHAdminMenu
{
	idc = 1607;
	show = false;
	moving = true;
	text = "Heal selected player"; //--- ToDo: Localize;
	action = "call MRH_fnc_MilsimTools_Admin_SingleHeal;";
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.626 * safezoneH + safezoneY;
	w = 0.223125 * safezoneW;
	h = 0.028 * safezoneH;

};
class MRHOpenJipForButton: RscButtonMRHAdminMenu
{
	idc = 1608;
	show = false;
	moving = true;
	text = "Remote open jip menu for selected player"; //--- ToDo: Localize;
	action = "call MRH_fnc_MilsimTools_Admin_SingleJipOpen;";
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.668 * safezoneH + safezoneY;
	w = 0.223125 * safezoneW;
	h = 0.028 * safezoneH;

};
class MRHSelectPunishmentCombo: RscComboMRHAdminMenu
{
	idc = 2102;
	show = false;
	moving = true;
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.71 * safezoneH + safezoneY;
	w = 0.223125 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHApplyPunishmentButton: RscButtonMRHAdminMenu
{
	idc = 1609;
	show = false;
	moving = true;
	text = "Apply selected punishment"; //--- ToDo: Localize;
	action = "call MRH_fnc_MilsimTools_Admin_Punisher;";
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.752 * safezoneH + safezoneY;
	w = 0.223125 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHResetHasDiedSingle: RscButtonMRHAdminMenu
{
	idc = 1610;
	show = false;
	moving = true;
	text = "Reset 'Has died variable' for selected player"; //--- ToDo: Localize;
	action = "call MRH_fnc_MilsimTools_Admin_SingleResetHasDied;";
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.794 * safezoneH + safezoneY;
	w = 0.223125 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHCamView: RscPictureMRHAdminMenu
{
	idc = 1200;
	show = false;
	moving = true;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.480312 * safezoneW + safezoneX;
	y = 0.178 * safezoneH + safezoneY;
	w = 0.275625 * safezoneW;
	h = 0.294 * safezoneH;
	colorBackground[] = {1,0,0,1};
};
class MRHAceArsenalButton: RscButtonMRHAdminMenu
{
	idc = 1611;
	show = false;
	moving = true;
	text = "Change player's gear"; //--- ToDo: Localize;
	action = "closedialog 0;_playerUid = lbdata [1500,(lbCurSel 1500)];_player = [_playerUid] call MRH_fnc_MilsimTools_Core_FindPlayerByUID;[_player, _player,true] call ACE_arsenal_fnc_openbox;";
	x = 0.480312 * safezoneW + safezoneX;
	y = 0.472 * safezoneH + safezoneY;
	w = 0.275625 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHMiniMap: RscMapControlMRHAdminMenu
{
	idc = 1108;
	show = false;
	moving = true;
	x = 0.480312 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.269062 * safezoneW;
	h = 0.294 * safezoneH;
	colorBackground[] = {1,0,0,1};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};