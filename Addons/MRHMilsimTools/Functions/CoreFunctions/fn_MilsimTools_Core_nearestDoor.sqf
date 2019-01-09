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

params ["_object",["_building",objNull]];

	
	if (isNull _building) then { _building = nearestBuilding _object};
	_selections = selectionNames _building;

	//find doors
	_allDoors = [];
	{
		//_testFor = _x find "door_";
		//if (_testFor != -1) then {_allDoors pushBack _x};
		_testFor = _x splitString "_";
		if (((_testFor select 0) == "door") && ((_testFor select 1) != "handle")) then {_allDoors pushBack _x};
	} forEach _selections;
	

	// sortDoors
	_nearestDoor = _allDoors select 0;
	{
		_position = _building modelToWorld (_building selectionPosition _x);
		if ((_object distance2D _position)< (_object distance2D (_building modelToWorld (_building selectionPosition _nearestDoor)))) then {_nearestDoor = _x};
	} forEach _allDoors;
	
	
	_nearestDoor