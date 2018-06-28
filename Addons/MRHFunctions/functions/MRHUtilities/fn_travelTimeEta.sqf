/*
Function name:MRH_fnc_travelTimeEta
Author: Mr H.
Description: returns the ETA from object to source (in seconds)
will return 0 if object is not moving
Return value: <NUMBER> time in seconds, 0 if object is not moving
Public: Yes
Parameters:
0 - <OBJECT> - Moving object
1 - <ARRAY> or <OBJECT> if <ARRAY> position 3d or position 2d
Example(s):
_estimatedTimeOfArrival = [heli,LZ] call MRH_fnc_travelTimeEta;
or
_estimatedTimeOfArrival = [heli,[X,Y,Z]] call MRH_fnc_travelTimeEta;
or
_estimatedTimeOfArrival = [heli,[X,Y]] call MRH_fnc_travelTimeEta;
or
_estimatedTimeOfArrival = [heli,getMarkerPos "LZ"] call MRH_fnc_travelTimeEta;
// some useful uses:
waitUntil {([heli,LZ] call MRH_fnc_travelTimeEta)<=60};
hint "Arrivée dans une minute"
// 
onEachFrame {_estimatedTimeOfArrival = [heli,LZ] call MRH_fnc_travelTimeEta; hintSilent format ["Temps estimé d'arrivée %1",str _estimatedTimeOfArrival];};
*/


params ["_object","_destination"];
_d = _object distance2d _destination; //en m
_d = _d/1000; // en km
_s = speed _object; // en km/h
if (_s < 0) then {_s = _s - (_s*2)};// prevents negative values when going backwards
if (_s == 0) ExitWith {_ETA =0;_ETA};

_ETA = _d/_s; //en h
_ETA = _ETA *3600;//en secondes

_ETA
