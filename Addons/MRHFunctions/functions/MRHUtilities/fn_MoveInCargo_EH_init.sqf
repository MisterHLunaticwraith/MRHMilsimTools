["mrh_milsimtools_moveInCargoEvent",{ 
	_this spawn
	{
		params ["_entityToMove","_veh"];
		Diag_Log format ["MRH MoveinCargoEH: Attempting to move  %1 in %2",_entityToMove,_veh];
		while {vehicle _entityToMove != _veh} do {_entityToMove moveInCargo _veh;};
		Diag_Log format ["MRH MoveinCargoEH: %1 moved in %2",_entityToMove,_veh];
	};

}] call CBA_fnc_addEventHandler;
//BIS_fnc_moveToRespawnPosition
//[B Alpha 1-1:1 (Mr H.),test]