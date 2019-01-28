class MRHSimpleHalo
{
	idd=170119;
    onUnload = "_logic =(_this select 0) getVariable 'MRH_ZeusModules_AssociatedLogic';deleteVehicle _logic";
	movingenable=true;
	
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Jecyna)
////////////////////////////////////////////////////////

class MRHBack: IGUIBackMRHZeusModules
{
	idc = 2200;
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.225 * safezoneH + safezoneY;
	w = 0.4125 * safezoneW;
	h = 0.55 * safezoneH;
};
class MRHPlayerList: RscListboxMRHZeusModules
{
	idc = 1500;
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.154 * safezoneH;
};
class MRHTitleMain: RscTextMRHZeusModules
{
	idc = 1000;
	text = $STR_MRH_MRHMRHZeusModules_HaloJumpName; //--- ToDo: Localize;
	x = 0.303125 * safezoneW + safezoneX;
	y = 0.241667 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHselectPlayerTitle: RscTextMRHZeusModules
{
	idc = 1001;
	text = $STR_MRH_MRHMRHZeusModules_SelectPCol; //--- ToDo: Localize;
	x = 0.304062 * safezoneW + safezoneX;
	y = 0.269 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHIncludeGroupTitle: RscTextMRHZeusModules
{
	idc = 1002;
	text = $STR_MRH_MRHMRHZeusModules_TELGRPCOL; //--- ToDo: Localize;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHTeleportWholeGroupChck: RscCheckboxMRHZeusModules
{
	idc = 2800;
	x = 0.494844 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHOptionsText: RscTextMRHZeusModules
{
	idc = 1003;
	text = $STR_MRH_MRHMRHZeusModules_JUMPOPTSCOL; //--- ToDo: Localize;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.159844 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHAddGearTitle: RscTextMRHZeusModules
{
	idc = 1004;
	text = $STR_MRH_MRHMRHZeusModules_AUTADDREQUGER; //--- ToDo: Localize;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.278437 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHAutoAddGearCheckBox: RscCheckboxMRHZeusModules
{
	idc = 2801;
	x = 0.690781 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHAltitudeTitle: RscTextMRHZeusModules
{
	idc = 1005;
	text = $STR_MRH_MRHMRHZeusModules_STARTALTMETERS; //--- ToDo: Localize;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHStartAltitudeEdit: RscEditMRHZeusModules
{
	idc = 1400;
	x = 0.530937 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHAADTitle: RscTextMRHZeusModules
{
	idc = 1006;
	text = $STR_MRH_MRHMRHZeusModules_AADOPALT; //--- ToDo: Localize;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHForceAADTitle: RscTextMRHZeusModules
{
	idc = 1007;
	text = $STR_MRH_MRHMRHZeusModules_FORCEAADALTSET; //--- ToDo: Localize;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.139219 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHForceAADALtitudeCheckBox: RscCheckboxMRHZeusModules
{
	idc = 2802;
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHForceAADALtitudeEdit: RscEditMRHZeusModules
{
	idc = 1401;
	x = 0.5 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHObjectsToBringTitle: RscTextMRHZeusModules
{
	idc = 1008;
	text = $STR_MRH_MRHMRHZeusModules_OBJECTSTOPARAWITHPLAYER; //--- ToDo: Localize;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHIncludedTitle: RscTextMRHZeusModules
{
	idc = 1009;
	text = $STR_MRH_MRHMRHZeusModules_ONBOARD; //--- ToDo: Localize;
	x = 0.304062 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHOnboardItemsList: RscListboxMRHZeusModules
{
	idc = 1501;
	x = 0.304062 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.253 * safezoneH;
};
class MRHAddonBoardButton: RscButtonMRHZeusModules
{
	idc = 1600;
	text = "<<"; //--- ToDo: Localize;
	x = 0.396875 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.033 * safezoneH;
    action = "if((lbtext[1502,(lbCursel 1502)])isEqualTo '')exitWith {};_index= lbAdd [1501,lbtext[1502,(lbCursel 1502)]];lbSetData[1501,_index,lbData[1502,(lbCursel 1502)]];lbDelete [1502,(lbCursel 1502)]";
};
class MRHRemoveonBoardButton: RscButtonMRHZeusModules
{
	idc = 1601;
	text = ">>"; //--- ToDo: Localize;
	x = 0.396875 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.033 * safezoneH;
    action = "if((lbtext[1501,(lbCursel 1501)])isEqualTo '')exitWith {};_index= lbAdd [1502,lbtext[1501,(lbCursel 1501)]];lbSetData[1502,_index,lbData[1501,(lbCursel 1501)]];lbDelete [1501,(lbCursel 1501)]";
};
class MRHAvailableList: RscListboxMRHZeusModules
{
	idc = 1502;
	x = 0.427812 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.253 * safezoneH;
};
class MRHAvailableTitle: RscTextMRHZeusModules
{
	idc = 1010;
	text = $STR_MRH_MRHMRHZeusModules_AVAILABLECOL; //--- ToDo: Localize;
	x = 0.427812 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHAutoEquipAAD: RscTextMRHZeusModules
{
	idc = 1011;
	text = $STR_MRH_MRHMRHZeusModules_AADAUTOADDOBJ; //--- ToDo: Localize;
	x = 0.520625 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHAutoEquipAADObjectsCheck: RscCheckboxMRHZeusModules
{
	idc = 2803;
	x = 0.62375 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHAADObjectsAltitudeTitle: RscTextMRHZeusModules
{
	idc = 1012;
	text = $STR_MRH_MRHMRHZeusModules_ALTOPENAADOBJ; //--- ToDo: Localize;
	x = 0.520625 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.118594 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHOpeningObjectsAADEdit: RscEditMRHZeusModules
{
	idc = 1402;
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.544 * safezoneH + safezoneY;
	w = 0.0464063 * safezoneW;
	h = 0.022 * safezoneH;
};
class MRHCancelButton: RscButtonMRHZeusModules
{
	idc = 1602;
	text = $STR_MRH_MRHMRHZeusModules_GENCANCEL; //--- ToDo: Localize;
	x = 0.530937 * safezoneW + safezoneX;
	y = 0.709 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.044 * safezoneH;
    action = "closedialog 0";
};
class MRHAcceptButton: RscButtonMRHZeusModules
{
	idc = 1603;
	text = $STR_MRH_MRHMRHZeusModules_GENACCEPT; //--- ToDo: Localize;
	x = 0.597969 * safezoneW + safezoneX;
	y = 0.709 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.044 * safezoneH;
    action = "call MRH_fnc_MilsimTools_ZeusModules_simpleHaloJumpModuleAction";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Cikihi)
////////////////////////////////////////////////////////

class MRHModuleAlt: RscTextMRHZeusModules
{
	idc = 1028;
	text = "LZ altitude (above see level):"; //--- ToDo: Localize;
	x = 0.536094 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.154687 * safezoneW;
	h = 0.022 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};