/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_onHeliCancelled;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_onHeliCancelled;
*/
#include "MRH_C_Path.hpp"
params ["_veh"];

_veh SVAR(isFlyingBackToBase,true,true);
_isPhysical= _veh GVARDef(isPhysicalHeli,false);
if !(_isPhysical) then {
	_veh setVehicleLock "LOCKED";
};
_veh flyInHeight 60;
_veh limitSpeed 99999;
[_veh,"Cancelled"]FUNC(handleMessages);


if (!isEngineOn _veh) then
{

	private _pilot = driver _veh;
	_pilot action ["engineOn",vehicle _pilot];
	waitUntil {isEngineOn _veh};
};
[_veh]FUNC(despawnOrGoHomeSwitch);
