/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_medEvacCallAction;
*/
#include "MRH_C_Path.hpp"
#include "dialogRefs.hpp"
_locationOK = [(ctrlText _locationEdit)]CFUNC(checkGridValidity);
if !(_locationOK) exitWith {hint (localize "STR_MRH_HeliTaxi_medEvacCallLocationError")};
_location = [(ctrlText _locationEdit)]CFUNC(parseCoordinates);

_marking = _zoneMarkingCombo lbData (lbCurSel _zoneMarkingCombo);

_numberOfPatients = parseNumber (ctrlText _numberOfPatientsEdit);


_specials = _specCombo lbData (lbCurSel _specCombo );

_surgeon = cbChecked _surgeonCheck;

_security = _securityCombo lbData (lbCurSel _securityCombo);

_nbc = cbChecked _nbcCheck;

_penalty = FUNC(medEvacCalculateTimePenalty);

[[MRH_player,_marking,_location,_numberOfPatients,_specials,_surgeon,_security,_nbc,_penalty],MRH_fnc_MilsimTools_HeliTaxi_medEvacServerCall] remoteExec ["Call",2];
closeDialog 0;
missionNameSpace setVariable [("MRH_HeliTaxi_medEvac_calledForSide_"+ (str(side MRH_player))),true,true];
playSound3D ["MRHHeliTaxi\AirTaxiSounds\MRH_HeliTaxi_medEvacRequest.ogg",MRH_player];

_requestMedEvac =
{
	params ["_player","_LZ"];
	if ((group MRH_player) != (group _player)) ExitWith {};
	_player sideChat format [(localize "STR_MRH_HeliTaxi_medEvacCallRequest"),([_LZ] CFUNC(realisticGrid)),(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
};

[[MRH_Player,_location],_requestMedEvac] RemoteExec ["Call",0];