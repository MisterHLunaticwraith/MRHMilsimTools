/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: a VARIANT of a FireSupport function
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_gridInputCheck;
*/
#include "MRH_C_Path.hpp"
_this spawn {
	params ["_ctrl"];
	#include "MRH_C_Path.hpp"
	
	sleep 0.2;
	
	_requestedPos = ctrlText 1400;

	_isValid = [_requestedPos] FUNC(checkGridValidity);
	if (_isValid) then {_ctrl ctrlSetTextColor [0, 1, 0, 1]} else {_ctrl ctrlSetTextColor [1, 0, 0, 1]};
	hintSilent format [localize "STR_MRH_FireSupport_charCheckHintMsg",_requestedPos,[(localize "STR_MRH_FireSupport_SC_LocInv"),(localize "STR_MRH_FireSupport_SC_LocVal")] select _isvalid];
};
