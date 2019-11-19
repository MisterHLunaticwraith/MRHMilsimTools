/*
Function name:MRH_fnc_MilsimTools_Core_addToBFTenabledList
Author: Mr H.
Description: Will add the class to vehicles or items that show up on the BluFor tracker (provided a friendly unit is in them or they have item on self)
Return value: List of all allowed classes, updated with new ones
Public: Yes
Parameters:
0-<STRING> or <ARRAY> of <STRINGS> can either be vehicles classnames or items classnames
Example(s):
["My_vehicle"]call MRH_fnc_MilsimTools_Core_addToBFTenabledList;
["My_item"]call MRH_fnc_MilsimTools_Core_addToBFTenabledList;
[["My_veh1","My_veh2","My_veh3","My_item1","My_item2"]]call MRH_fnc_MilsimTools_Core_addToBFTenabledList;
*/
#include "MRH_C_Path.hpp"
params ["_add"];
private _allowedClasses = missionNamespace getVariable ["MRH_soldierTab_BFT_enabling_items_andVehs",[]];
if ((typeName _add)isEqualTo "ARRAY")then {_allowedClasses append _add};
if ((typeName _add)isEqualTo "STRING")then {_allowedClasses pushBackUnique _add};
missionNamespace setVariable ["MRH_soldierTab_BFT_enabling_items_andVehs",_allowedClasses,true];
_allowedClasses