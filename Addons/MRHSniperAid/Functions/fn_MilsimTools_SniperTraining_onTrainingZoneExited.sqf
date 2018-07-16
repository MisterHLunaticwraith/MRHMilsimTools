/*
Function name:MRH_fnc_MilsimTools_SniperTraining_onTrainingZoneExited
Author: Mr H.
Description: Removes event handlers and hints the player when they leave the training area
Return value:None
Public:No
Parameters: None
Example(s):
call MRH_fnc_MilsimTools_SniperTraining_onTrainingZoneExited;
*/
#include "MRH_C_Path.hpp"
if (player inArea _this) ExitWith {};
_EHindexes = player getVariable "MRH_BulletCamEHsIndexes";
if ((isNil "_EHindexes") or (_EHindexes isEqualTo [])) ExitWith {};
_FiredEH = _EHindexes select 0;
_KeydownEH = _EHindexes select 1;
player removeEventHandler ["FiredMan", _FiredEH];
(findDisplay 46) displayRemoveEventHandler ["Keydown", _KeydownEH]; 
player setVariable ["MRH_BulletCamEHsIndexes", []];
hintC (localize "STR_MRH_SniperTraining_HintExiting");
onEachFrame {};