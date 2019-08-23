/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_;
*/
#include "MRH_C_Path.hpp"
	params ["_position"];
_pos = [[[_position, 800]],["ground",[_position, 400]],{([_this] call MRH_fnc_MilsimTools_Core_returnDepth) < -20}] call BIS_fnc_randomPos;
if (_pos isEqualTo [0,0]) then {_pos = _position; systemChat "defaulted"};
_pos