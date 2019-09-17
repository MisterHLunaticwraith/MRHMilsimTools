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
if (!isServer) exitWith {};
private["_logic","_units","_activated","_groups","_heliGroup","_heli","_caller"];
_logic = _this param [0, objNull, [objNull]];
_units = _this param [1, [], [[]]];
_activated = _this param [2,true,[true]];

_groups = [];
_heliGroup = grpNull;
_heli = objNull;
_caller = objNull;
{
	_groups pushBackUnique (group _x);
	if (_x isKindOf "Air") then {_heli =_x};
}forEach _units;
_groups deleteAt (_groups find (group _heli));
if (isNull _heli) exitWith {systemChat "heliNull"};
if (_groups isEqualTo []) exitWith {systemChat "grpNull"};
_group = _groups select 0;
_caller = leader _group;

_EHHeliownerKilled = _caller addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit] FUNC(onCallerKilled);
}];
_caller SVAR(KilledEHIndex,_EHHeliownerKilled,true);

_toTrace= format ["Heli Module %4 initiated found groups %1,selected heli:%2 and caller %3",_groups,_heli,_caller,_logic];
TRACE(_toTrace);
[_heli,_caller]FUNC(isPhysicalHeli);