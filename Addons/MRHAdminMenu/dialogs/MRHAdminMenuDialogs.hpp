#define ROOTPATH "\MRHAdminMenu
#define PAAPATH(ARG) ROOTPATH\paa\##ARG"
class MRHCustomAdminMenu
{
	idd=312103;
	movingenable=true;
	
	class controls 
	{


////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Piveje)
////////////////////////////////////////////////////////

class MRHPlayersList: RscListboxMRHAdminMenu
{
	idc = 1500;
	onMouseButtonClick = "call MRH_fnc_RefreshPlayerIntel;";
	x = 0.040625 * safezoneW + safezoneX;
	y = 0.108 * safezoneH + safezoneY;
	w = 0.196875 * safezoneW;
	h = 0.77 * safezoneH;
};
class MRHFond: RscPictureMRHAdminMenu
{
	idc = 1200;
	text = PAAPATH(window.paa);
	x = 0.2375 * safezoneW + safezoneX;
	y = 0.108 * safezoneH + safezoneY;
	w = 0.702187 * safezoneW;
	h = 0.77 * safezoneH;
};
class MRHPlayerName: RscStructuredTextMRHAdminMenu
{
	idc = 1100;
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.122 * safezoneH + safezoneY;
	w = 0.360937 * safezoneW;
	h = 0.392 * safezoneH;
};

class MRHPlayerCameraView: RscPictureMRHAdminMenu
{
	idc = 1202;
	text = PAAPATH(mrh.paa);
	x = 0.618125 * safezoneW + safezoneX;
	y = 0.122 * safezoneH + safezoneY;
	w = 0.308437 * safezoneW;
	h = 0.392 * safezoneH;
};
class MRHHealAllButton: RscButtonMRHAdminMenu
{
	idc = 1600;
	text = "Soigner tous les joueurs"; //--- ToDo: Localize;
	action = "call MRH_fnc_HealAll;";
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.822 * safezoneH + safezoneY;
	w = 0.269062 * safezoneW;
	h = 0.042 * safezoneH;
};
class MRHResetHasDiedAll: RscButtonMRHAdminMenu
{
	idc = 1601;
	text = "Reset de la variable ""HasDied"" pour tous."; //--- ToDo: Localize;
	action = "[false] call MRH_fnc_SetHasDiedAll;";
	x = 0.513125 * safezoneW + safezoneX;
	y = 0.822 * safezoneH + safezoneY;
	w = 0.23625 * safezoneW;
	h = 0.042 * safezoneH;
};
class MRHExitButton: RscButtonMRHAdminMenu
{
	idc = 1602;
	text = "Quitter"; //--- ToDo: Localize;
	action = "closedialog 0";
	x = 0.749375 * safezoneW + safezoneX;
	y = 0.822 * safezoneH + safezoneY;
	w = 0.164062 * safezoneW;
	h = 0.042 * safezoneH;
};
class MRHHealPlayer: RscButtonMRHAdminMenu
{
	idc = 1603;
	text = "Soigner le joueur selectionné"; //--- ToDo: Localize;
	x = 0.618125 * safezoneW + safezoneX;
	y = 0.528 * safezoneH + safezoneY;
	w = 0.308437 * safezoneW;
	h = 0.042 * safezoneH;
};
class MRHPunishSquats: RscButtonMRHAdminMenu
{
	idc = 1604;
	text = "Punir (Squats)"; //--- ToDo: Localize;
	x = 0.618125 * safezoneW + safezoneX;
	y = 0.626 * safezoneH + safezoneY;
	w = 0.308437 * safezoneW;
	h = 0.042 * safezoneH;
};
class MRHPunishPushUps: RscButtonMRHAdminMenu
{
	idc = 1605;
	text = "Punir (Pompes)"; //--- ToDo: Localize;
	x = 0.618125 * safezoneW + safezoneX;
	y = 0.668 * safezoneH + safezoneY;
	w = 0.308437 * safezoneW;
	h = 0.042 * safezoneH;
};
class MRHPunishChicken: RscButtonMRHAdminMenu
{
	idc = 1606;
	text = "Punir (poulet)"; //--- ToDo: Localize;
	x = 0.618125 * safezoneW + safezoneX;
	y = 0.71 * safezoneH + safezoneY;
	w = 0.308437 * safezoneW;
	h = 0.042 * safezoneH;
};
class MRHUnChicken: RscButtonMRHAdminMenu
{
	idc = 1607;
	text = "Enlever le poulet"; //--- ToDo: Localize;
	x = 0.618125 * safezoneW + safezoneX;
	y = 0.752 * safezoneH + safezoneY;
	w = 0.308437 * safezoneW;
	h = 0.042 * safezoneH;
};
class MRHPlayerResetHasdied: RscButtonMRHAdminMenu
{
	idc = 1608;
	text = "Reset de la variable ""HasDied"" pour ce joueur."; //--- ToDo: Localize;
	x = 0.618125 * safezoneW + safezoneX;
	y = 0.57 * safezoneH + safezoneY;
	w = 0.308437 * safezoneW;
	h = 0.056 * safezoneH;
};
class MRHEndMission: RscButtonMRHAdminMenu
{
	idc = 1609;
	text = "Mettre fin à la mission"; //--- ToDo: Localize;
	action = "call MRH_fnc_endMission;";
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.738 * safezoneH + safezoneY;
	w = 0.354375 * safezoneW;
	h = 0.056 * safezoneH;
};
class MRHMissionTime: RscStructuredTextMRHAdminMenu
{
	idc = 1101;
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.514 * safezoneH + safezoneY;
	w = 0.360937 * safezoneW;
	h = 0.042 * safezoneH;
};

class MRHMissionInfos: RscStructuredTextMRHAdminMenu
{
	idc = 1102;
	x = 0.250625 * safezoneW + safezoneX;
	y = 0.556 * safezoneH + safezoneY;
	w = 0.360937 * safezoneW;
	h = 0.182 * safezoneH;
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};