/*
Function name:MRH_fnc_MoveInCargo
Author: Mr H.
Description: this function will move given array of units into given vehicle. This function is a workaround to the fact that moveincargo command works poorly in multiplayer (even if you get the locality right).
FAIR WARNING: this function is a brutal hack, it has been known to cause server desyncs on some occasions, you should BY NO MEANS remote exec it or call it globally (from a trigger for example).YOU HAVE BEEN FAIRLY WARNED ;-)
Return value: None
Public: Yes
Parameters:
0- <ARRAY> group of units
1 - <OBJECT> Vehicle to move units to
Example(s):
[allplayers,plane] call MRH_fnc_MoveInCargo;
*/
#include "MRH_C_Path.hpp"
	
	Params ["_groupOfplayers", "_vehicle"];
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