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
params ["_object"];


_statement = {
_object = _this select 0;
[_object] FUNC(Hack);

};

_action =
["hack", 
(localize "STR_MRH_HP_AceHack"),
 "\MRHFunctions\img\icons\hack.paa", 
 
_statement 


, 
 {true},
 {},
 [],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
 
