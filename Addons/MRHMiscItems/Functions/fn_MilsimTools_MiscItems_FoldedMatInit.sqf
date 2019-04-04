/*
Function name:MRH_fnc_MilsimTools_MiscItems_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_MiscItems_;
*/
#include "MRH_C_Path.hpp"
params ["_mat"];


_statement = {
	params ["_mat"];
	_color = [_mat] FUNC(returnMatColor);
	_pos = getPosATL _mat;
	deleteVehicle _mat;
	_toCreateString = "MRH_ShootingMat_" + _color;
	createVehicle [_toCreateString,_pos, [], 0, "CAN_COLLIDE"];

	};
_loc = "Unfold Shooting mat";
_action =
["MRH_ShootingMatFoldedUnfold", 
_loc,
 "",
_statement , 
 {true},
 {},
 [_mat],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_mat, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
 
 _statementCollect = {
	params ["_mat"];
	_color = [_mat] FUNC(returnMatColor);
	deleteVehicle _mat;
	_toAdd = "MRH_ShootingMat_" + _color;
	player addItem _toAdd;

	};
_loc = "Collect folding mat";
_actionCollect =
["MRH_ShootingMatFoldedCollect", 
_loc,
 "",
_statementCollect , 
 {true},
 {},
 [_mat],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_mat, 0, ["ACE_MainActions"], _actionCollect] call ace_interact_menu_fnc_addActionToObject;