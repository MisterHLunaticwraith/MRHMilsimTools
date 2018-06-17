/*
Function name:MRH_fnc_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call ;
*/
#include "MRH_C_Path.hpp"
params ["_object","_PointA"];

_object SVAR(passdestination,_PointA,false);

_statement = {
_object = _this select 0;
[_object] FUNC(ElevatorCore);

};

_action =
["lift", 
(localize "STR_MRH_EL_CallElev"),
 "\MRHFunctions\img\icons\lift.paa", 
 
_statement 


, 
 {true},
 {},
 [],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
 