/*
Function name:MRH_isAirInsertionPlanner
Author: Mr H.
Description: adds ace action to open Air insertion interface.
Return value: None
Public: Yes
Parameters:
0-<OBJECT> - Object to apply the action to
1-<SIDE> - side necessary to access this object
Example(s):
[this,WEST] call MRH_fnc_isAirInsertionPlanner;
*/
#include "MRH_C_Path.hpp"
params ["_object","_side"];
_object setVariable ["MRH_InsertionHandler_isAirInsertionPlanner_"+ str _side,true,true];
_object SVAR(interfaceSide,_side,true);
_statement = {FUNC(openInterface)};
_loc = (localize "STR_MRH_MRHInsertionHandler_accessInterfaceAceAction"); 
_action =
["MRH_Insertion_interface_access", 
_loc,
 PAAPATH(paradrop.paa),
_statement , 
 {side _player == _target GVAR(interfaceSide)},
 {},
 [],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
 