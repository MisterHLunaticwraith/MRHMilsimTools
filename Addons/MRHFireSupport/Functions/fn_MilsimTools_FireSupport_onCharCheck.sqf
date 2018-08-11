/*
Function name:MRH_fnc_MilsimTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[] call MRH_fnc_MilsimTools_FireSupport_onCharCheck;

*/
[] spawn {
	#include "MRH_C_Path.hpp"
	
	sleep 0.2;
	_ctrl = FDIS(1400);
	_requestedPos = ctrlText 1400;

	_isValid = [_requestedPos] FUNC(checkGridValidity);
	if (_isValid) then {_ctrl ctrlSetTextColor [0, 1, 0, 1]} else {_ctrl ctrlSetTextColor [1, 0, 0, 1]};
	hintSilent format [localize "STR_MRH_FireSupport_charCheckHintMsg",_requestedPos,[(localize "STR_MRH_FireSupport_SC_LocInv"),(localize "STR_MRH_FireSupport_SC_LocVal")] select _isvalid];
};
