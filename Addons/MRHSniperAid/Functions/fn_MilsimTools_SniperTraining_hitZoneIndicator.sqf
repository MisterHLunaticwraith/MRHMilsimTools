/*
Function name:MRH_fnc_MilsimTools_SniperTraining_hitZoneIndicator
Author: Mr H.
Description: Shows an icon where target was hit
Return value: None
Public: No
Parameters:
Example(s):
call MRH_fnc_MilsimTools_SniperTraining_hitZoneIndicator;
*/
#include "MRH_C_Path.hpp"
params ["_positionHit","_hitSelections","_target"];
_posdebug =  _positionHit;
_positionHit = ASLToAGL _positionHit;
//systemchat format ["before %1 after %2", str _posdebug, str _positionHit];
player setVariable ["MRH_HitZonePos", [_positionHit, _hitSelections, _target]];
onEachFrame { 
_positionHit = (player getVariable "MRH_HitZonePos") select 0;
_hitSelections = (player getVariable "MRH_HitZonePos") select 1;
_target = (player getVariable "MRH_HitZonePos") select 2;
if (_target isKindOf "Man") then {_positionHit =_target modelToWorld (_target selectionPosition (_hitSelections select 0));};



 drawIcon3D ["\MRHSniperAid\Paa\target.paa", [1,0,0,1], _positionHit, 0.5, 0.5, 0,(localize "STR_MRH_SniperTraining_ImpactPoint"), 2, 0.05, "PuristaLight", "center", true]; 
}; 
