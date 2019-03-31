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
//detach parachutes when object is under 0.6m ATL
[
	{((getPosATL (_this select 0)) select 2)<0.6}, 
	{
		_toDrop = _this select 0;
		detach _toDrop;
		_paras =  nearestObjects [_toDrop,["O_Parachute_02_F"],10];
		{
			detach _x;
			_x setVelocity [5,0,0];

			[{if !(isNull _this) then {deleteVehicle _this};},_x, 30] call CBA_fnc_waitAndExecute;
			
		} forEach _paras;
		_toDrop setVelocity [0,0,-5];
	}, 
[_toDrop]
] call CBA_fnc_waitUntilAndExecute;	

//reenable damage and reset velocity when object is touching ground
[
	{isTouchingGround (_this select 0)}, 
	{
		_toDrop = _this select 0;
		_toDrop setVelocity [0,0,0];
		_toDrop allowDamage true;

	}, 
[_toDrop]
] call CBA_fnc_waitUntilAndExecute;	