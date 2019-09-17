/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
[side player] call MRH_fnc_MilsimTools_HeliTaxi_resetMedEvacVars;
*/
#include "MRH_C_Path.hpp"
params ["_side"];
missionNamespace setVariable [("MRH_HeliTaxi_CurrentMedEvacHeli_"+ (str _side)),nil,true];
missionNameSpace setVariable [("MRH_HeliTaxi_medEvac_calledForSide_"+ (str _side)),nil,true];
missionNamespace setVariable [("MRH_MilsimTools_MEDEVAC_DelayBetween_"+ (str _side)),CBA_missionTime,true];
[[_side],{
	params ["_side"];

	if (side MRH_player != _side) exitWith {};
	deleteMarkerLocal "MRH_LZ_Evac_Marker";
}] RemoteExec ["Call",[0,-2] select isDedicated];