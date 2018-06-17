_object = _this select 0;
[_object] spawn {
	params ["_object"];
	#include "MRH_C_Path.hpp"
	_PointA = _object GVAR(passdestination);
	_dist = player distance _object;
	if (_dist >10) ExitWith {};
	player setPosATL (getPosATL _PointA);
	[] spawn {
	_video = ["\MRHFunctions\videos\elevator.ogv"] spawn BIS_fnc_playVideo; 
	waitUntil {!(isNil "BIS_fnc_playVideo_finished")};
	};
	sleep 7;
	
	playsound "MRH_Functions_ElevatorDing";
};