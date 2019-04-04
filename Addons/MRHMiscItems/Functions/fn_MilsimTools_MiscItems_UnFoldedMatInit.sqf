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
[_mat, true, [0, 2, 0], 10] call ace_dragging_fnc_setDraggable; // has to be added by code, doesn't work with cfg on base object
_cutter= createVehicle ["Land_ClutterCutter_medium_F", (getPosATL _mat), [], 0, "CAN_COLLIDE"];
_cutter setDir (getDir _mat);
_cutter attachTo [_mat,[0,0,0]];
_mat setVariable ["MRH_MatAssGrasscutter",_cutter];

_mat addEventHandler ["Deleted", {
	params ["_entity"];
  _toDelete= _entity getVariable ["MRH_MatAssGrasscutter",objNull];
  deleteVehicle _toDelete;

}];

 _statementCollect = {
	params ["_mat"];
	_color = [_mat] FUNC(returnMatColor);
	//deleteVehicle _mat;
	//_toAdd = "MRH_ShootingMat_" + _color;
	//MRH_player addItem _toAdd;
	[_mat,MRH_player] CFUNC(addItem);

	};
_loc = localize "STR_MRH_MRHMiscItems_pickUpMat";
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
 [_mat, 0, ["ACE_MainActions"], _actionCollect] call ace_interact_menu_fnc_addActionToObject
 