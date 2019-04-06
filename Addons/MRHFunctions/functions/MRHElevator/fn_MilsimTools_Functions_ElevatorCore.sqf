
params ["_object"];
#include "MRH_C_Path.hpp"
_PointA = _object GVAR(passdestination);
_dist = MRH_player distance _object;
if (_dist >10) ExitWith {};
MRH_player setPosATL (getPosATL _PointA);
[] spawn {
_video = ["\MRHFunctions\videos\elevator.ogv"] spawn BIS_fnc_playVideo; 

};
[
    {
        playsound "MRH_Functions_ElevatorDing";
    }, 
    [], 
    7
] call CBA_fnc_waitAndExecute;
	
	
