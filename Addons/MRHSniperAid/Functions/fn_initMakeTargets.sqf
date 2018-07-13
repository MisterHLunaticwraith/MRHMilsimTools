//_allObjects = entities [[], ["Logic"], true, false];
_allObjects = allMissionObjects "";
{
_check = str _x splitString "_";
if ((_check select 1) == "TrainingTarget") then {[_x] call MRH_fnc_isTarget;};


} forEach _allObjects;