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

if (isNull _medevac) exitWith {false};
if (!alive _medevac) exitWith {false};
if (_medevac getVariable ["MRH_HeliTaxi_medEvacInOperation",false]) exitWith {false};
if (_medevac getVariable ["MRH_HeliTaxi_isCancelled",false]) exitWith {false};
_hasPlayers = false;
_hasNPJ = false;
{
	if (isPlayer _x) then {_hasPlayers = true};
	private _isCrew = _x getVariable ["MRH_HeliTaxi_isHeliCrew",false];
	if !(_isCrew) then  {_hasNPJ = true};
} forEach (crew _medevac);
if (_hasNPJ) exitWith {false};
if (_hasPlayers) exitWith {false};
_caller = _medevac getVariable ["MRH_HeliTaxi_MEDEVAC_Caller",objNull];
if !((group _caller) isEqualTo (group MRH_player)) exitWith {false};
true