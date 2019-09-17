/*
Function name:MRH_fnc_MilsimTools_Core_lockNonCargo
Author: Mr H.
Description: Locks (unlocks) all vehicle crew slots(driver gunner commander turrets) but not cargo slots (including FFV) AG/EG (unlike engine lock commands)
Return value: none
Public: No
Parameters:
0-<OBJECT> vehicle to lock
1-<BOOL>-Optional, default 'true' set to false to unlock
Example(s):
[myVehicle]call MRH_fnc_MilsimTools_Core_lockNonCargo; // locks all non cargo seats
[myVehicle,false]call MRH_fnc_MilsimTools_Core_lockNonCargo; // UNlocks all non cargo seats
*/
#include "MRH_C_Path.hpp"
params ["_veh",["_lock",true]];
[_this,{
	params ["_veh",["_lock",true]];
	_turrets = allTurrets [_veh, false];
	{
	_veh lockTurret [_x,_lock];
	} forEach _turrets;
	_veh lockDriver _lock;
}]remoteExec ["Call",_veh];