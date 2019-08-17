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
_LD = (_this select 0) select 0;

 _statementCollect = {
	params ["_LD"];
	[_LD,MRH_player] CFUNC(addItem);


	};
_loc = localize "STR_MRH_MRHMiscItems_LDFoldAndPickUp";
_actionCollect =
["MRH_LaserDesignator_actionCollect", 
_loc,
 "",
_statementCollect , 
 {true},
 {},
 [_LD],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_LD, 0, ["ACE_MainActions"], _actionCollect] call ace_interact_menu_fnc_addActionToObject;

 ////////

  _statementUse = {
	params ["_LD"];
	MRH_player action ["SwitchToUAVDriver",_LD];

	};
_loc = localize "STR_MRH_MRHMiscItems_LaserDesignatorUse";
_actionUse =
["MRH_LaserDesignator_actionUse", 
_loc,
 "",
_statementUse, 
 {true},
 {},
 [_LD],
 [0,0,0], 
 5] call ace_interact_menu_fnc_createAction;
 ////
 [_LD, 0, ["ACE_MainActions"], _actionUse] call ace_interact_menu_fnc_addActionToObject;