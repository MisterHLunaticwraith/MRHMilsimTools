/*
Function name:MRH_fnc_MilsimTools_AddonName_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_AddonName_;
*/
#include "MRH_C_Path.hpp"


_this spawn {
	params ["_ctrlAnKey",["_condition",{true}],["_invert",false]];
	#include "MRH_C_Path.hpp"
	_ctrlAnKey params ["_ctrl","_key"];
	sleep 0.2;
	
	_typed = ctrlText _ctrl;

	_isValid = [_typed] call _condition;
	if (_invert) then {_isvalid = !(_isvalid)};
	if (_isValid) then {_ctrl ctrlSetTextColor [0, 1, 0, 1]} else {_ctrl ctrlSetTextColor [1, 0, 0, 1]};
	
};
