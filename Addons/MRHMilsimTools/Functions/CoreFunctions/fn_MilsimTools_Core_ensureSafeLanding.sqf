/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: makes sure parachuted objects lands correctly,and that the parachutes are deleted in cas of bug
Return value: none
Public: No
Parameters:
0- <OBJECT> parachuted object
Example(s):
[prachutedObject]spawn MRH_fnc_MilsimTools_Core_ensureSafeLanding;
*/
#include "MRH_C_Path.hpp"
params ["_toDrop"];
	_toDrop allowDamage false;
	waitUntil{((getPosATL _toDrop) select 2)<0.6};
	
	detach _toDrop;
	_paras =  nearestObjects [_toDrop,["O_Parachute_02_F"],10];
	{
		detach _x;
		_x setVelocity [5,0,0];
		0 = _x spawn {sleep 30; if !(isNull _this) then {deleteVehicle _this}; };
	} forEach _paras;
	_toDrop setVelocity [0,0,-5];

	waitUntil {isTouchingGround _toDrop};
	_toDrop setVelocity [0,0,0];
	_toDrop allowDamage true;
