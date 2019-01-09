/*
Function name:MRH_fnc_MilsimTools_MiscItems_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_MiscItems_;
*/
#include "MRH_C_Path.hpp"
params ["_scanner"];
if (is3DEN) exitWith {};
waitUntil {time>1};
[[_scanner],
{
	if (isServer && isDedicated) exitWith {};
	params ["_scanner"];

	_hackVar = "MRH_"+ (str player) + "_hasHackedAScanner";
	[20, _scanner,_hackVar,
		{
			params ["_scanner"];
			_hackersList = _scanner getVariable ["MRH_scanner_hasBeenHackedBy",[]];
			_hackersList pushBackUnique (getPlayerUID player);
			_scanner setVariable ["MRH_scanner_hasBeenHackedBy",_hackersList,true];
			
		}
	] call MRH_fnc_Hack;
}] remoteExec ["Call",0,true];