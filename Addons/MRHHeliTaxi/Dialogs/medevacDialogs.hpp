#include "medevacDefines.hpp"
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Rutoxi)
////////////////////////////////////////////////////////
class MRH_MedevacMenu
{
	idd= 290819;
   
	movingenable = false;
    onUnLoad = "";
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mr H., v1.063, #Ryzyby)
////////////////////////////////////////////////////////

class MRHBack: RscPictureMRHMedevac
{
	idc = 1200;
	text = "\MRHHeliTaxi\Paa\notepad_ca.paa";
	x = 0 * safezoneW + safezoneX;
	y = 0 * safezoneH + safezoneY;
	w = 1 * safezoneW;
	h = 1 * safezoneH;
};
class MRHTtitle: RscStructuredTextMRHMedevac
{
	idc = 1600;
	text = $STR_MRH_HeliTaxi_NatoMedEvacTitle; //--- ToDo: Localize;
	x = 0.530937 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.319688 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRH1: RscStructuredTextMRHMedevac
{
	idc = 1601;
	text = $STR_MRH_HeliTaxi_LocationTitle; //--- ToDo: Localize;
	x = 0.530937 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.180469 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHLocationEdit: RscEditMRHMedevac
{
	idc = 1400;
	onChar = "[((findDisplay 290819)displayCtrl 1400)]call MRH_fnc_MilsimTools_Core_gridInputCheck;";
	onKeyDown = "if ((_this select 1)==14)ExitWith {[((findDisplay 290819)displayCtrl 1400)] call MRH_fnc_MilsimTools_Core_gridInputCheck;};";
	x = 0.711406 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.139219 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHLine3: RscStructuredTextMRHMedevac
{
	idc = 1602;
	text = $STR_MRH_HeliTaxi_NumberPatientsTitle; //--- ToDo: Localize;
	x = 0.530937 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.237187 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHNumberOfPatientsEdit: RscEditMRHMedevac
{
	idc = 1401;
	text = "1";
	onChar = "[]spawn {sleep 0.5;call MRH_fnc_MilsimTools_HeliTaxi_medEvacRefreshPenaltyText;};";
	onKeyDown = "if ((_this select 1)==14)ExitWith {[]spawn {sleep 0.5;call MRH_fnc_MilsimTools_HeliTaxi_medEvacRefreshPenaltyText;};};";
	x = 0.757813 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.033 * safezoneH;
};
class MRHSpecialequipmenttext: RscStructuredTextMRHMedevac
{
	idc = 1603;
	text = $STR_MRH_HeliTaxi_specialGearTitle; //--- ToDo: Localize;
	x = 0.530937 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.134062 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHEquipmentCombo: RscComboMRHMedevac
{
	idc = 2100;
	onLBSelChanged ="call MRH_fnc_MilsimTools_HeliTaxi_medEvacRefreshPenaltyText;";
	x = 0.665 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.185625 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRH2: RscStructuredTextMRHMedevac
{
	idc = 1604;
	text = $STR_MRH_HeliTaxi_freqCallSignTitle; //--- ToDo: Localize;
	x = 0.530937 * safezoneW + safezoneX;
	y = 0.368 * safezoneH + safezoneY;
	w = 0.319688 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHLine5DoctorOnSite: RscStructuredTextMRHMedevac
{
	idc = 1605;
	text = $STR_MRH_HeliTaxi_sendSurgeonTitle; //--- ToDo: Localize;
	x = 0.530937 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.28875 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHDoctorCheckBox: RscCheckBoxMRHMedevac
{
	idc = 1606;
	onCheckedChanged = "call MRH_fnc_MilsimTools_HeliTaxi_medEvacRefreshPenaltyText;";
	x = 0.819688 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHSecurity: RscStructuredTextMRHMedevac
{
	idc = 1607;
	text = $STR_MRH_HeliTaxi_securityTitle; //--- ToDo: Localize;
	x = 0.530937 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY;
	w = 0.139219 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHSecurityCombo: RscComboMRHMedevac
{
	idc = 2101;
	onLBSelChanged ="call MRH_fnc_MilsimTools_HeliTaxi_medEvacRefreshPenaltyText;";
	x = 0.670156 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY;
	w = 0.175313 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHMarkingUpText: RscStructuredTextMRHMedevac
{
	idc = 1608;
	text = $STR_MRH_HeliTaxi_markingPickupTitle; //--- ToDo: Localize;
	x = 0.530937 * safezoneW + safezoneX;
	y = 0.577 * safezoneH + safezoneY;
	w = 0.128906 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHZoneMarking: RscComboMRHMedevac
{
	idc = 2102;
	x = 0.665 * safezoneW + safezoneX;
	y = 0.577 * safezoneH + safezoneY;
	w = 0.185625 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHL8: RscStructuredTextMRHMedevac
{
	idc = 1609;
	text = $STR_MRH_HeliTaxi_patientNationalityTitle; //--- ToDo: Localize;
	x = 0.530937 * safezoneW + safezoneX;
	y = 0.621 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHNationalityCombo: RscComboMRHMedevac
{
	idc = 2103;
	onLBSelChanged ="call MRH_fnc_MilsimTools_HeliTaxi_medEvacRefreshPenaltyText;";
	x = 0.659844 * safezoneW + safezoneX;
	y = 0.621 * safezoneH + safezoneY;
	w = 0.190781 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHNBC: RscStructuredTextMRHMedevac
{
	idc = 1610;
	text = $STR_MRH_HeliTaxi_nbcContTitle; //--- ToDo: Localize;
	x = 0.530937 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.293906 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHNBCCheckBox: RscCheckBoxMRHMedevac
{
	idc = 1611;
	onCheckedChanged = "call MRH_fnc_MilsimTools_HeliTaxi_medEvacRefreshPenaltyText;";
	x = 0.824844 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHTimeMalusText: RscStructuredTextMRHMedevac
{
	idc = 1612;
	text = $STR_MRH_HeliTaxi_penaltyTextTitle; //--- ToDo: Localize;
	x = 0.530937 * safezoneW + safezoneX;
	y = 0.709 * safezoneH + safezoneY;
	w = 0.319688 * safezoneW;
	h = 0.066 * safezoneH;
};
class MRHCancelButton: RscButtonMRHMedevac
{
	idc = 1613;
	text = $STR_MRH_HeliTaxi_CancelButton; //--- ToDo: Localize;
	action = "closeDialog 0";
	x = 0.726875 * safezoneW + safezoneX;
	y = 0.775 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.044 * safezoneH;
};
class MRHCallButton: RscButtonMRHMedevac
{
	idc = 1614;
	text = $STR_MRH_HeliTaxi_callButtonMed; //--- ToDo: Localize;
	action = "call MRH_fnc_MilsimTools_HeliTaxi_medEvacCallAction";
	x = 0.78875 * safezoneW + safezoneX;
	y = 0.775 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.044 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};