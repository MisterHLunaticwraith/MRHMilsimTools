class MRHJipMenu
{
	idd=210382;
	movingenable=true;
	
	class controls 
	{
		class MRHJipCustomPic: RscPictureMRHJIP
{
	idc = 1200;
	moving = true;
	text = "\MRHJipMenu\GUI\fond.paa";
	x = 0.2375 * safezoneW + safezoneX;
	y = 0.15 * safezoneH + safezoneY;
	w = 0.525 * safezoneW;
	h = 0.7 * safezoneH;
};
	class MRHGrpPicker: RscComboMRHJIP
{
	idc = 2100;
	moving = true;
	onLBSelChanged = "call MRH_fnc_MilsimTools_Jip_RefreshPlayerList;";
	text = ""; //--- ToDo: Localize;
    action= "";
	x = 0.303125 * safezoneW + safezoneX;
	y = 0.29 * safezoneH + safezoneY;
	w = 0.190312 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHJipFrame: RscFrameMRHJIP
{
	idc = 1800;
	moving = true;
	text = "MRH Jip Menu"; //--- ToDo: Localize;
	x = 0.2375 * safezoneW + safezoneX;
	y = 0.15 * safezoneH + safezoneY;
	w = 0.525 * safezoneW;
	h = 0.7 * safezoneH;
};
class MRHJipIntrotext: RscStructuredTextMRHJIP
{
	idc = 1100;
	moving = true;
	text = $STR_MRH_JIP_INTER_YOUJIPPEDMESSAGE;
	x = 0.244063 * safezoneW + safezoneX;
	y = 0.178 * safezoneH + safezoneY;
	w = 0.374063 * safezoneW;
	h = 0.07 * safezoneH;
};
class MRHOrgGroup: RscStructuredTextMRHJIP
{
	idc = 1101;
	moving = true;
	text = "<t color = '#F91515' > dummytext</t>";
	x = 0.454062 * safezoneW + safezoneX;
	y = 0.234 * safezoneH + safezoneY;
	w = 0.0984375 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHSelectGroupText: RscStructuredTextMRHJIP
{
	idc = 1102;
	moving = true;
	text = $STR_MRH_JIP_INTER_SELECTGROUP;
	x = 0.244062 * safezoneW + safezoneX;
	y = 0.262 * safezoneH + safezoneY;
	w = 0.229687 * safezoneW;
	h = 0.07 * safezoneH;
};
class MRHPlayerPickerText: RscStructuredTextMRHJIP
{
	idc = 1103;
	moving = true;
	text = $STR_MRH_JIP_INTER_SELECTPLAYER;
	x = 0.244062 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.413437 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHPlayerPicker: RscListboxMRHJIP
{
	idc = 1500;
	moving = true;
	x = 0.244062 * safezoneW + safezoneX;
	y = 0.402 * safezoneH + safezoneY;
	w = 0.511875 * safezoneW;
	h = 0.238 * safezoneH;
};
class MrhWarning: RscStructuredTextMRHJIP
{
	idc = 1104;
	moving = true;
	text = $STR_MRH_JIP_INTER_DEADPLAYERWARNING;
	x = 0.2375 * safezoneW + safezoneX;
	y = 0.668 * safezoneH + safezoneY;
	w = 0.538125 * safezoneW;
	h = 0.028 * safezoneH;
};
class MRHButtonCANCEL: RscButtonMRHJIP
{
	idc = 678910;
	moving = true;
	text = $STR_MRH_JIP_INTER_CANCEL;
	action = "closedialog 0";
	x = 0.270313 * safezoneW + safezoneX;
	y = 0.738 * safezoneH + safezoneY;
	w = 0.0525 * safezoneW;
	h = 0.07 * safezoneH;
};
class MRHButtonExec: RscButtonMRHJIP
{
	idc = 678911;
	moving = true;
	text = $STR_MRH_JIP_INTER_JOINBUTTON;
	action = "[lbData [ 1500, (lbCurSel 1500)]] call MRH_fnc_MilsimTools_Jip_JoinSelectedPlayer;";
	x = 0.591875 * safezoneW + safezoneX;
	y = 0.738 * safezoneH + safezoneY;
	w = 0.164062 * safezoneW;
	h = 0.07 * safezoneH;
};

	};
};