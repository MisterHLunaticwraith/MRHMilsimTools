/*
this functiun sits a unit in MP
params are unit, chair, condition, if condition is not set unit is left sitting undefinetly
eg
[cobaye, chair1, {(cobaye GetVariable "IsStanding") == 1}] call MRH_fnc_sitOnChair;
[object,object,{code}] call MRH_fnc_sitOnChair;
works properly with: "Land_CampingChair_V2_F","Land_ChairWood_F"
toDO adapt with "Land_CampingChair_V1_F" and others// will require to rewrite a function like BisFnc_AMbient
*/
params ["_unit","_chair","_condition"];

[[_unit,"SIT1", "ASIS", _chair], BIS_fnc_ambientAnim] remoteExec ["call"];

if (!isNil "_condition") then { 
 0 = [_unit, _condition] spawn {
 
 params ["_unit", "_condition"];

 _cond = _condition;
 waitUntil {(_unit call _cond)};
[[_unit], BIS_fnc_ambientAnim__terminate] remoteExec ["call"];};
};
/*
cobaye setDir (getdir chair2 +180)
*/