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

//eg [nearestBuilding player,([player] call MRH_fnc_nearestDoorNumber),true] call MRH_fnc_lockDoor;
	params ["_building","_doorNumber",["_open",false]];
	 _DoorString = "BIS_disabled_Door_" + _doorNumber;
 	_doorAnimString = "Door_"+_doorNumber + "_rot";
	 if (_open) then
	 {
		 _building setVariable [_DoorString, 0, true];
		 _building animate [_doorAnimString, 1];
	 }
	 else 
	 {
		 _building setVariable [_DoorString, 1, true];
		 _building animate [_doorAnimString, 0];
	 };