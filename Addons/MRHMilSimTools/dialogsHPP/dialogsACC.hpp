////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Dugoju)
////////////////////////////////////////////////////////
class MRHACCMenu
{
	idd=030590;
	movingenable=true;
	
	class controls 
	{


class MRHFond: RscPictureMRHACC
{
	idc = 1200;
	text = "\MRHMilSimTools\GUI\fond.paa";
	x = 0.26375 * safezoneW + safezoneX;
	y = 0.332 * safezoneH + safezoneY;
	w = 0.2625 * safezoneW;
	h = 0.336 * safezoneH;
};
class MRHFrame: RscFrameMRHACC
{
	idc = 1800;
	text = "Gestion Des Pertes"; //--- ToDo: Localize;
	x = 0.26375 * safezoneW + safezoneX;
	y = 0.332 * safezoneH + safezoneY;
	w = 0.2625 * safezoneW;
	h = 0.336 * safezoneH;
};

class MRHTextJoueursMorts: RscStructuredTextMRHACC
{
	idc = 1100;
	text = "xx joueurs sont morts."; //--- ToDo: Localize;
	x = 0.276875 * safezoneW + safezoneX;
	y = 0.374 * safezoneH + safezoneY;
	w = 0.170625 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHJoueurDebut: RscStructuredTextMRHACC
{
	idc = 1101;
	text = "Il y avait xx joueurs en début de mission."; //--- ToDo: Localize;
	x = 0.276875 * safezoneW + safezoneX;
	y = 0.402 * safezoneH + safezoneY;
	w = 0.196875 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHPourcentage: RscStructuredTextMRHACC
{
	idc = 1102;
	text = "xx pourcents des joueurs sont morts."; //--- ToDo: Localize;
	x = 0.276875 * safezoneW + safezoneX;
	y = 0.43 * safezoneH + safezoneY;
	w = 0.18375 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHEndMissionButton: RscButtonMRHACC
{
	idc = 1600;
	text = "Mettre fin à  la mission."; //--- ToDo: Localize;
	action = "MRH_fnc_EndMission RemoteExec [""Call"", 0, true];";//"[] execVM ""MRHACCMenu\endmission.sqf"";";
	x = 0.276875 * safezoneW + safezoneX;
	y = 0.486 * safezoneH + safezoneY;
	w = 0.13125 * safezoneW;
	h = 0.042 * safezoneH;
};
class MRHReset: RscButtonMRHACC
{
	idc = 1601;
	text = "Autoriser les joueurs morts à  revenir en jeu."; //--- ToDo: Localize;
	action = "MRH_fnc_Allow RemoteExec [""Call"", 0, true];";
	x = 0.276875 * safezoneW + safezoneX;
	y = 0.542 * safezoneH + safezoneY;
	w = 0.216562 * safezoneW;
	h = 0.042 * safezoneH;
};
class MRHBoutonAnnuler: RscButtonMRHACC
{
	idc = 1602;
	text = "Annuler"; //--- ToDo: Localize;
	action = "closedialog 0";
	x = 0.276875 * safezoneW + safezoneX;
	y = 0.598 * safezoneH + safezoneY;
	w = 0.0853125 * safezoneW;
	h = 0.042 * safezoneH;
};
class MRHDeadPlayersList: RscListboxMRHACC
{
	idc = 1500;
	x = 0.52625 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.18375 * safezoneW;
	h = 0.322 * safezoneH;
};

	};
	};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
