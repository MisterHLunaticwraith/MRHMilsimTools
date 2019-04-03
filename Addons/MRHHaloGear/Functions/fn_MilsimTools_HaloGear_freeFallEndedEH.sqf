/*
Function name:MRH_fnc_MilsimTools_AddonName_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_AddonName_;
*/
#include "MRH_C_Path.hpp"
if !(hasInterface) exitWith {};

[
    {!([player] FUNC(isFreeFalling))}, 
    {
		["MRH_freefallEnded_eh", [player]] call CBA_fnc_localEvent;
		FUNC(startedFreeFallEH);
	}, 
    []
] call CBA_fnc_waitUntilAndExecute;