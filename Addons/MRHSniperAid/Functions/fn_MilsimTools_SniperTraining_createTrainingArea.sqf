/*
Function name:MRH_fnc_MilsimTools_SniperTraining_createTrainingArea
Author: Mr H.
Description: Creates a training zone where bullet cam and shot statistics are enabled.
Return value: None
Public: Yes
Parameters:
0- <OBJECT> Object to base the zone around, use of invisible helipad is advised.
1 -<NUMBER> Radius size in meters
2 -<NUMBER> Height of the training zone (Optional, Default 10)
Example(s):
[this,20] call MRH_fnc_MilsimTools_SniperTraining_createTrainingArea;
or
[this,20,10] call MRH_fnc_MilsimTools_SniperTraining_createTrainingArea;
*/
#include "MRH_C_Path.hpp"

if (isServer && isDedicated) ExitWith {};
params ["_SourceObject","_spreadDistance",["_ZoneHeight",10]];
[_SourceObject,_spreadDistance,_ZoneHeight] spawn {
waitUntil {player == player};
params ["_SourceObject","_spreadDistance","_ZoneHeight"];
_trg = createTrigger ["EmptyDetector", getPos _SourceObject, false];
_trg setTriggerArea [_spreadDistance, _spreadDistance, 0, false,_ZoneHeight];
_trg setTriggerActivation ["VEHICLE", "PRESENT", true];
_trg triggerAttachVehicle [player];
_trg setTriggerStatements ["this", 
"thisList call MRH_fnc_MilsimTools_SniperTraining_onTrainingZoneEntered;"
, "thisTrigger call MRH_fnc_MilsimTools_SniperTraining_onTrainingZoneExited"];
};