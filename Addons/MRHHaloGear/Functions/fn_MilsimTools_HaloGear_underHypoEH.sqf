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


_hypoHeight = ["MRH_MilsimTools_HaloGear_hypoxiaAltitude"] call cba_settings_fnc_get;



[
    {((getPosASL player) select 2)< (_this select 0)}, 
    {
		["MRH_underHypoxiaLevel_eh", [player]] call CBA_fnc_localEvent;
		FUNC(aboveHypoEH);
	}, 
    [_hypoHeight]
] call CBA_fnc_waitUntilAndExecute;
