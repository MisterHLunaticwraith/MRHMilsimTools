/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_
Author: Mr H.
Description:
Checks that:
1- the maximum number of helis for side has not been reached 
2 - the player's group isn't currently using a heli 
3 - the player isn't considered dead by the mod
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_isHeliTaxiAvailable;
*/
#include "MRH_C_Path.hpp"

_settingsValue = missionNamespace getVariable ["MRH_MilsimTools_HeliTaxi_simultaneousPerSide_" + str (side player),1];
_currentlyUsed  = missionNamespace getVariable ["MRH_MilsimTools_HeliTaxi_currentlyUsedHelisPerSide_" + (str side player),0];
if (_currentlyUsed >= _settingsValue) ExitWith {false};
_groupHasHeli = (group player) GVARDef(isUsingHeli,false);
if (_groupHasHeli) exitWith {false};
_isMilsimToolsDead = player getVariable ["MRH_MilsimTools_Core_HasDied",false];
if (_isMilsimToolsDead) exitWith {false};

true