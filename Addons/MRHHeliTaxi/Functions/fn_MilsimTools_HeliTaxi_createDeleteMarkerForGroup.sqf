/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_createDeleteMarkerForGroup;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_createDeleteMarkerForGroup;
*/
#include "MRH_C_Path.hpp"
params ["_grp","_LZ",["_behaviorType","MRH_heli"],["_delete",false]];

_action = "";
if (_delete) then 
{
	_action =
	{
		params ["_grp","_LZ","_behaviorType"];

		 if !(group MRH_player == _grp ) ExitWith {};
		 
		 deleteMarkerLocal "MRH_LZ_Marker_Final";
	};
} else 
{
	_action =
	 {
		 params ["_grp","_LZ","_behaviorType"];

		 if !(group MRH_player == _grp ) ExitWith {};

		_marker = createMarkerLocal ["MRH_LZ_Marker_Final", _LZ];
		_marker setMarkerTypeLocal _behaviorType;
		_marker setMarkerTextLocal (localize "STR_MRH_HeliTaxi_MarkerSelectedLz");
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerAlphaLocal 1;

	 };
};

[[_grp,_LZ,_behaviorType],_action] RemoteExec ["Spawn", [0,-2] select isDedicated];