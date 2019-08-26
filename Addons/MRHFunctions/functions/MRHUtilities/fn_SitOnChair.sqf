/*
Function name:MRH_fnc_sitOnChair
Author: Mr H.
Description: Sits given unit on a chair, can be run from only one client and will work globally. The difference with Arma's default ambient animation function is that you can add a condition that will make the unit stand up.
Return value: None
Public: yes
Parameters:
0-<OBJECT> - Unit to sit
1- <OBJECT> - Chair to sit the unit on (works properly with: "Land_CampingChair_V2_F","Land_ChairWood_F")
2 - <CODE> -Optional, condition to let the unit stand, must be stated between {};
Example(s):
[cobaye, chair1, {(cobaye GetVariable ["IsAllowedToStand",false])}] call MRH_fnc_sitOnChair;
*/

params ["_unit","_chair",["_condition",{false}]];

[[_unit,"SIT1", "ASIS", _chair], BIS_fnc_ambientAnim] remoteExec ["call",0];

if !(_condition isEqualTo {false}) then { 
 0 = [_unit, _condition] spawn {
 
 params ["_unit", "_condition"];

 _cond = _condition;
 waitUntil {(_unit call _cond)};
[[_unit], BIS_fnc_ambientAnim__terminate] remoteExec ["call",0];};
};
