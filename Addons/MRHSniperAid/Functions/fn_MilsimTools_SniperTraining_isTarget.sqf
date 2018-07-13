/*
Function name:MRH_fnc_MilsimTools_SniperTraining_isTarget
Author: Mr H.
Description: Will turn the object into a potential training target, required for shot parameters to be returned (if the player is in a training area of course)
Return value: None
Public: yes
Parameters:
0-<OBJECT> - object to make a tarket
Example(s):
[this] call MRH_fnc_MilsimTools_SniperTraining_isTarget;
*/
#include "MRH_C_Path.hpp"
params ["_target"];
_target addEventHandler ["HitPart", {[(_this select 0)] call MRH_fnc_MilsimTools_SniperTraining_ReturnShotParams;}];
if (_target isKindOf "Man") then {_target addEventHandler ["Hit", {(_this select 0)setVariable ["MRH_TargetReceivedDamage", (_this select 2), true];}];};
