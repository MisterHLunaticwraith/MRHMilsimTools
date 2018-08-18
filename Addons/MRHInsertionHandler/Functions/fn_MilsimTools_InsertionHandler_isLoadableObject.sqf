/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_isLoadableObject;
*/
#include "MRH_C_Path.hpp"
params ["_object"];

_statement = {[_target] call MRH_fnc_MilsimTools_InsertionHandler_prepareCargoForLoading;};
_loc = "Prep cargo for loading"; 
_action =
["MRH_Insertion_PrepCargo_Init", 
_loc,
 "",
_statement , 
 {[_target] call MRH_fnc_MilsimTools_InsertionHandler_conditionsToBeLoadAble;},
 {},
 [],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
 
 