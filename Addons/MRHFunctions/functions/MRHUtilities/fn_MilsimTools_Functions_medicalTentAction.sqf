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

params ["_tent"];

_statement = {
	params ["_tent"];
		_tent animateSource ["Door_Hide",[1,0] select (_tent FUNC(medicalTentIsOpen)),true];
		playSound3D ["MRHFunctions\sounds\MRH_Functions_Zipper.ogg", _tent];
};
{
private _action =["MRH_ToogleMedTent_open", 
(localize "STR_MRH_FUNCS_ActionOpenTent"),
 "", 
 _statement, 
 {true},
 {},
 [_tent],
[0,0,0], 
 6] call ace_interact_menu_fnc_createAction;

 [_tent, 0, [_x], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach ["MRH_TentAction_Door1","MRH_TentAction_Door2"];