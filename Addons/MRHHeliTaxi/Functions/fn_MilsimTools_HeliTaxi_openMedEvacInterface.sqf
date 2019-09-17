/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_openMedevacInterface;
*/
#include "MRH_C_Path.hpp"
createDialog "MRH_MedevacMenu";
#include "dialogRefs.hpp"

// prefil location
_location = MRH_player GVARDef(previouslySetCoords,([position MRH_player]CFUNC(realisticGrid)));
_locationEdit ctrlSetText _location;

//fill specials combo
_specials = 
[	
	["none",(localize "STR_MRH_HeliTaxi_medEvacSpecialsNone")],
	["ACE_MedicalCrate",(localize "STR_MRH_HeliTaxi_medEvacSpecialsAceCrate")],
	["MRH_medicalTent",(localize "STR_MRH_HeliTaxi_medevacSpecialsFieldTent")]
];

{
 _index = _specCombo lbAdd (_x select 1);
 _specCombo lbSetData [_index,(_x select 0)];
}forEach _specials;
_specCombo lbSetCurSel 0;
_intel =MRH_player getVariable ["MRH_MilsimTools_Core_PlayerIntel",[groupId (group MRH_player),(getText(configFile >> "CfgVehicles" >> typeOf( MRH_player) >> "displayName")),(localize "STR_MRH_HeliTaxi_medEvacDefaultRadioLR")]];
_intel params ["_grpId","_notNeeded","_RF"];

_freqStrTxt ctrlSetStructuredText parseText  ((localize "STR_MRH_HeliTaxi_freqCallSignTitle")+ " "+_grpId + " " + _RF);

_securityStatus =
[
	["safe",(localize "STR_MRH_HeliTaxi_medEvacNoEnemies")],
	["unsafe",(localize "STR_MRH_HeliTaxi_medEvacEnemyTroopsEscort")]
];

{
	_index = _securityCombo lbAdd (_x select 1);
	_securityCombo lbSetData [_index, (_x select 0)];
}forEach _securityStatus;
_securityCombo lbSetCurSel 0;

_zoneMarkingMethods =[];
_zoneMarkingMethodsAvail =
[
	"SmokeShellGreen",
	"SmokeShell",
	"ACE_HandFlare_Green",
	"B_IR_Grenade",
	"ACE_Chemlight_HiGreen"
];

_extraMarkings =missionNamespace getVariable "MRH_MilsimTools_HeliTaxi_MEDEVAC_itemsCall";
{
	_zoneMarkingMethodsAvail pushBackUnique _x;
}forEach _extraMarkings;
//-------------
if !(CFUNC(isNight)) then
{
	{
	if ((((_x splitString "_") select 1) == "IR")) then 
		{
			_zoneMarkingMethodsAvail deleteAt (_zoneMarkingMethodsAvail find _x);
		
		}; 
	} forEach _zoneMarkingMethodsAvail;
};

//-----------------

{
		if (_x in (magazines MRH_player)) then {_zoneMarkingMethods pushBackUnique _x};
}forEach _zoneMarkingMethodsAvail;


if (_zoneMarkingMethods isEqualTo []) exitWith {closedialog 0; hint (localize "STR_MRH_HeliTaxi_medEvacCantMarkNoItem")};

{
	_index = _zoneMarkingCombo lbAdd (getText (configFile>>"cfgMagazines">>_x >> "displayName"));
	_zoneMarkingCombo lbSetData [_index,_x];

}forEach _zoneMarkingMethods;
_zoneMarkingCombo lbSetCurSel 0;

_patientNationalities =
[
	["Coalition",(localize "STR_MRH_HeliTaxi_medEvacTypeUSMIL")],
	["CoalitionCiv",(localize "STR_MRH_HeliTaxi_medEvacTypeUSCIV")],
	["NonUsSold",(localize "STR_MRH_HeliTaxi_medevactypeNONUSMIL")],
	["NonUsCiv",(localize "STR_MRH_HeliTaxi_medEvacTypeNonUs")],
	["POW",(localize "STR_MRH_HeliTaxi_medEvacTypePOW")],
	["HVT",(localize "STR_MRH_HeliTaxi_medEvacTypeHVT")]
];

{
	_index = _nationalityCombo lbAdd (_x select 1);
	_nationalityCombo lbSetData [_index,(_x select 0)];
}forEach _patientNationalities;
_nationalityCombo lbSetCurSel 0;