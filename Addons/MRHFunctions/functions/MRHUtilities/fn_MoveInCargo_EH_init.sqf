#include "MRH_C_Path.hpp"
["mrh_milsimtools_moveInCargoEvent",{ 
	_this spawn
	{
		params ["_entityToMove","_veh","_index"];
		_trace1 = format ["MRH MoveinCargoEH: Attempting to move  %1 in %2",_entityToMove,_veh];
		TRACE(_trace1);
		_attempts = 0;
		moveOut _entityToMove;
		while {(vehicle _entityToMove != _veh) && _attempts <10} do 
		{
			_attempts = _attempts +1;
			_entityToMove assignAsCargoIndex [_veh, _index];
			_entityToMove moveInCargo _veh;
			sleep 0.1;
		};
		_trace2 ="";
		if (vehicle _entityToMove == _veh) then {_trace2 = format ["MRH MoveinCargoEH: %1 moved in %2 at attempt %3",_entityToMove,_veh,_attempts];}else {_trace2 = format ["MRH MoveinCargoEH: FAILED to move %1 in %2",_entityToMove,_veh];};
		TRACE(_trace2);
	};

}] call CBA_fnc_addEventHandler;
//BIS_fnc_moveToRespawnPosition
//[B Alpha 1-1:1 (Mr H.),test]