/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_medEvacServerCall;
*/
#include "MRH_C_Path.hpp"
if !(isServer) exitWith {};

params ["_caller","_marking","_location","_numberOfPatients","_specials","_surgeon","_security","_nbc","_penalty"];

_mainHeliClasses = missionNamespace getVariable ("MRH_MilsimTools_HeliTaxi_Helis_MEDEVAC_" + (str side _caller));


_mainHeli = [_mainHeliClasses,_numberOfPatients] CFUNC(selectHasEnoughCargo);


_safePos =[_location] FUNC(medEvacFindSafePos);
[[_caller,_safePos,_penalty],{
	
	params ["_caller","_safePos","_penalty"];
	if !(hasInterface) exitWith {};
	if ((group MRH_player) != (group _caller)) exitWith {};
	deleteMarkerLocal "MRH_LZ_Evac_Marker"; 
 _marker = createMarkerLocal ["MRH_LZ_Evac_Marker",_safePos];
 _marker setMarkerTypeLocal "MRH_medical"; 
 _marker setMarkerTextLocal (localize "STR_MRH_HeliTaxi_MarkerSelectedLz"); 
 _marker setMarkerColorLocal "ColorGreen"; 
 _marker setMarkerAlphaLocal 1;
 


}] remoteExec ["Call",0];
_parameters = _this;
_parameters pushBackUnique _safePos;
_parameters pushBackUnique _mainHeli;

[
    {
		params ["_caller","_marking","_location","_numberOfPatients","_specials","_surgeon","_security","_nbc","_penalty","_safePos","_mainHeli"];

		_marking = (getText (configfile >> "CfgMagazines" >> _marking >>"ammo"));

		if ((_safePos nearObjects [_marking, 50]) isEqualTo []) exitWith {false};
		(simulationEnabled ((_safePos nearObjects [_marking, 50]) select 0))

	}, 
    {
		params ["_caller","_marking","_location","_numberOfPatients","_specials","_surgeon","_security","_nbc","_penalty","_safePos","_mainHeli"];
				//----send message when marker is seen
				_beadOnPos =
				{
					params ["_player","_penalty"];
					if ((group MRH_player) != (group _player)) ExitWith {};
					[_penalty]FUNC(timeLeftBeforeEvacCounter);
					sleep 6;
					[side _player, "HQ"] sideChat format ["This is CROSSROADS we've got eyes on your marker %1 , ANGEL 1-1  will reach your position soon",(_player getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];
					playSound "MRH_HeliTaxi_markerSeen";
				};
				[[_caller,_penalty],_beadOnPos] RemoteExec ["Spawn",[0,-2]select isDedicated];

				//----call the cavalry
			[
				{
					params ["_caller","_marking","_location","_numberOfPatients","_specials","_surgeon","_security","_nbc","_penalty","_safePos","_mainHeli"];
					[_caller,_safePos,_mainHeli,_surgeon,_specials,_nbc,_security] spawn MRH_fnc_MilsimTools_HeliTaxi_medEvacSpawnAndGo;
					
				}, 
				_this, 
				_penalty
			] call CBA_fnc_waitAndExecute;
	}, 
    _parameters,
	(["MRH_MilsimTools_MEDEVAC_timeToReachLZ"]call cba_settings_fnc_get),//timeOut
	{
		_side = side (_this select 0);

		[_side]FUNC(resetMedEvacVars);
		[[(_this select 0)],{
			params ["_caller"];
			if ((group MRH_player)!= (group _caller)) exitWith {};
			hint (localize "STR_MRH_HeliTaxi_medEvacFailedLZ");
			playSound "MRH_HeliTaxi_cancelMedEvac";
		}]RemoteExec ["Call",0];
	}
] call CBA_fnc_waitUntilAndExecute;