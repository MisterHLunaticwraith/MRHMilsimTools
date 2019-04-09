/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_;
*/
#include "MRH_C_Path.hpp"

params ["_pivot","_className","_relPos","_relDir","_isAceMedicalFacility","_isMRHSatelliteConsole","_isMRHSatelliteScreen","_isAmmoBox","_AmmoCrateParams",["_isAceRepairFacility",0]];
/*
{
	_x = [_x]FUNC(stringToBool);
}forEach [_isAceMedicalFacility,_isMRHSatelliteConsole,_isMRHSatelliteScreen,_isAmmoBox,_AmmoCrateParams];
*/

_isAceMedicalFacility= [_isAceMedicalFacility]FUNC(stringToBool);
_isMRHSatelliteConsole = [_isMRHSatelliteConsole]FUNC(stringToBool);
_isMRHSatelliteScreen= [_isMRHSatelliteScreen]FUNC(stringToBool);
_isAmmoBox = [_isAmmoBox]FUNC(stringToBool);


if ((_relpos select 2) < 0) then {_relPos =[(_relPos select 0),(_relPos select 1),0]};
_object = _className createVehicle _relPos;
//_object = createVehicle [_className, _relPos, [], 0, "CAN_COLLIDE"];
_object setPosATL (_pivot modelToWorld _relPos);
_object setDir ((getDir _pivot) + _reldir);
_object setVectorUp surfaceNormal (getPosATL _object);
_object setVariable ["ace_medical_ismedicalfacility",_isAceMedicalFacility,true];
_object setVariable ["ace_isrepairfacility",_isAceRepairFacility,true];

//if ("MRHSatellite" in activatedAddons) then {
	if (_isMRHSatelliteConsole) then {[[_object],MRH_fnc_IsSatelliteConsole] remoteExec ["Call",[0,-2] select isDedicated,true]};
	if (_isMRHSatelliteScreen) then {[[_object],MRH_fnc_IsSatMonitor] remoteExec ["Call",[0,-2] select isDedicated,true]};
//};

if (_isAmmoBox) then {
	_AmmoCrateParams params ["_number","_unli","_refresh"];
	_unli = [_unli]FUNC(stringToBool);
	_refresh = [_refresh]FUNC(stringToBool);


	[[_object,_number,_unli,_refresh],MRH_fnc_AmmoCrate] remoteExec ["Call",[0,-2] select isDedicated,true];
	};
_object	