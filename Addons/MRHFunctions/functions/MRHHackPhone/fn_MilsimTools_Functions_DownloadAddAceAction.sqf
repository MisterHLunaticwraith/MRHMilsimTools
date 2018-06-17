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
[_object] FUNC(DownloadProgress);

};

_action =
["download", 
(localize "STR_MRH_HP_DLFile"),
 "\MRHFunctions\img\icons\download.paa", 
 
_statement 


, 
 {true},
 {},
 [],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject; 
 
