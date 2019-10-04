/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_curatorViewEH;
*/
#include "MRH_C_Path.hpp"
params ["_display"];

["MRH_curatorViewOpened_global", [player]] call CBA_fnc_globalEvent;
["MRH_curatorViewOpened", [_display,player]] call CBA_fnc_localEvent;

private _code=	{
	params ["_display"];
		["MRH_curatorViewClosed_global", [player]] call CBA_fnc_globalEvent;
		["MRH_curatorViewClosed", [_display,player]] call CBA_fnc_localEvent;
	};
[
    {isNull _this}, 
    _code, 
    _display
] call CBA_fnc_waitUntilAndExecute;
