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
	params ["_sdv"];
	_isAttached = _sdv getVariable ["MRH_isAttachedToSub",false];
	_protPilot = _sdv getVariable ["MRH_leadSDV",objNull];
	(((driver _sdv) isEqualTo MRH_player) && ((speed _protPilot) < 2) && _isAttached)