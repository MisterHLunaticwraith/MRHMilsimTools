/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_;
*/
#include "MRH_C_Path.hpp"

_medevac =missionNamespace getVariable [("MRH_HeliTaxi_CurrentMedEvacHeli_"+ (str (side MRH_player))),objNull];
_medEvac setVariable ["MRH_HeliTaxi_isCancelled",true,true];
if (isNull _medevac) exitWith {};
[[_medevac,MRH_player],
{
	params ["_medEvac","_caller"];
	[_medEvac,"CancelMedEvac"] FUNC(handleMessages);

	_surgeon = _medEvac getVariable ["MRH_HeliTaxi_assignedSurgeon",objNull];
	if !(isNull _surgeon) then {
		if (alive _surgeon) then {_surgeon moveInCargo _medEvac};
	};

	_escortGuys = _medEvac getVariable ["MRH_HeliTaxi_escortHelis",[objNull,objNull]];
	

	{
		if !(isNull _x) then
		{
			if (alive _x) then {
			deleteWaypoint ((waypoints group _x) select ((count (waypoints group _x)) -1));
			_x  commandMove (_medEvac modelToWorld [([-100,100] select _forEachIndex),-2000,0]);
			};
		};
	}forEach _escortGuys;
	_medEvac commandMove (_medEvac modelToWorld [0,-2000,0]);

[[_caller],{params ["_caller"]; if !(hasInterface) exitWith {}; if ((group MRH_player) isEqualTo (group _caller)) then {deleteMarkerLocal "MRH_LZ_Evac_Marker";};}] RemoteExec ["Call",0];
	[
		{
			params ["_allUnits","_medEvac","_caller"];
			{[_x] CFUNC(deleteVehicleAndCrew);}forEach _allunits;
			[side _medEvac] FUNC(resetMedevacVars);
			[_medEvac] CFUNC(deleteVehicleAndCrew);
			
		}, 
    [_escortGuys,_medEvac,_caller], 
    30
	] call CBA_fnc_waitAndExecute;


}]remoteExec ["Call",_medEvac]; //should always be server but you never know