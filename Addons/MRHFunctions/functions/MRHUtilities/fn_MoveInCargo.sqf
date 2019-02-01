/*
Function name:MRH_fnc_MoveInCargo
Author: Mr H.
Description: this function will move given array of units into given vehicle. This function is a workaround to the fact that moveincargo command works poorly in multiplayer (even if you get the locality right).
FAIR WARNING: this function is a brutal hack, it has been known to cause server desyncs on some occasions, you should BY NO MEANS remote exec it or call it globally (from a trigger for example).YOU HAVE BEEN FAIRLY WARNED ;-)
// the above might not be true anymore, I used the solution used by ACE 3 , all credits for the method goes to them
Return value: None
Public: Yes
Parameters:
0- <ARRAY> group of units
1 - <OBJECT> Vehicle to move units to
Example(s):
[allplayers,plane] call MRH_fnc_MoveInCargo;
*/
#include "MRH_C_Path.hpp"
[_this,
{
	Params ["_groupOfplayers", "_vehicle"];
	if !(isServer) exitWith {};
	_grpSize = count _groupOfplayers;
	_vehicleFreeIndexes = [_vehicle]call MRH_fnc_MilsimTools_Core_freeCargoIndexes;
	if (_vehicleFreeIndexes isEqualTo []) exitWith {_trace= format ["MRH_MoveinCargo no cargo space in %1",_vehicle];TRACE(_trace)};
	_cargoSize = count _vehicleFreeIndexes;
	_groupToSend = [];
	_groupToStay = [];

	if (_grpSize > _cargoSize) then {
		_groupToSend = [_groupOfplayers, 0,(_cargoSize -1)] call BIS_fnc_subSelect;
		 _groupOfplayers apply {if !(_x in _groupToSend) then {_groupToStay pushBackUnique _x}};
	} else {_groupToSend = _groupOfplayers};
_countToSend = count _groupToSend;

_trace2= format ["MRH_MoveinCargo group size: %1,cargosize %2,count to send %5, group to send %3, group to stay %4",_grpSize,_cargoSize,_groupToSend,_groupToStay,_countToSend];
TRACE(_trace2);

	for "_i" from 0 to (_countToSend -1) do
	{
		private _index = _vehicleFreeIndexes select _i;
		private _unit = _groupToSend select _i;
		if (isNull _unit || isNil "_unit") exitWith {};
		["mrh_milsimtools_moveInCargoEvent", [_unit, _vehicle,_index], _unit] call CBA_fnc_targetEvent;
		waitUntil {(vehicle _unit == _vehicle)};
	};
	
}] RemoteExec ["Spawn",2];
/*
{
["mrh_milsimtools_moveInCargoEvent", [_x, _vehicle], _x] call CBA_fnc_targetEvent;
} forEach _groupOfplayers;
*/
	/*
	//old solution
	{	
		//this scope will be remote executed for all given players
		[[_vehicle,_x],{	
			Params ["_vehicle","_entityToMove"];
			if (isPlayer _entityToMove) then {_entityToMove = player};//might not be necessary
			//innermost scope create trigger localy
			//step 0 generate a random contion variable
			
			
			//step 1 pass the variables to the player
			_trg = createTrigger ["EmptyDetector", [0,0,0],false];
			
			_trg setVariable ["MRH_MoveInCargoVeh",_vehicle];
			_trg setVariable ["MRH_MoveInCargoEntity",_entityToMove];
			//step 2 create the trigger, get the variables from player
				
				_trg setTriggerActivation ["NONE", "PRESENT", false];
				_trg triggerAttachVehicle [player];
				_trg setTriggerStatements ["true", 
				"
				
				_veh = thisTrigger getVariable 'MRH_MoveInCargoVeh';
				_entityToMove = thisTrigger getVariable 'MRH_MoveInCargoEntity';
				[_entityToMove,_veh] spawn {params ['_entityToMove','_veh'];while {vehicle _entityToMove != _veh} do {_entityToMove moveInCargo _veh;};};
				deleteVehicle thisTrigger;

				"
				, ""];
			
		}] RemoteExec ["Call",_x,true];
	} forEach _groupOfplayers;
	*/