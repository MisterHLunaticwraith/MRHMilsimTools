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

_EH = [] spawn {
_hypoHeight = ["MRH_MilsimTools_HaloGear_hypoxiaAltitude"] call cba_settings_fnc_get;

waitUntil {((getPosASL player) select 2)> _hypoHeight};
["MRH_aboveHypoxiaLevel_eh", [player]] call CBA_fnc_localEvent;
FUNC(underHypoEH);
};