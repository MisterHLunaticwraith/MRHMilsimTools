/*
Function name:MRH_fnc_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
//must run on all clients
[this] call MRH_fnc_dataTerminalAnimate;
*/
#include "MRH_C_Path.hpp"
params ["_DT",["_videoToPlay","\MRHMiscItems\Videos\compuHack.ogv"]];
[_DT,_videoToPlay] spawn {
	params ["_DT",["_videoToPlay","\MRHMiscItems\Videos\compuHack.ogv"]];

	[_DT, "red", "blue", "green"] call BIS_fnc_DataTerminalColor;
	[_DT, 1] call BIS_fnc_DataTerminalAnimate;
	_DT say3D "MRH_DT_computerStartUp";
	sleep 2;
	[_DT, 2] call BIS_fnc_DataTerminalAnimate;
	_DT say3D "MRH_DT_computerBip";
	sleep 2;
	[_DT, 3] call BIS_fnc_DataTerminalAnimate;
	_DT say3D "MRH_DT_computerKeyStrokes";
	[_DT,_videoToPlay] spawn MRH_fnc_MilsimTools_Core_playVideoOnObject;
};