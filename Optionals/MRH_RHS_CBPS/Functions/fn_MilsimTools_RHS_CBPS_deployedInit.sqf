/*
Function name:MRH_fnc_MilsimTools_RHS_CBPS_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_RHS_CBPS_;
*/
#include "MRH_C_Path.hpp"
if (is3DEN) exitWith {};
if (!isServer) exitWith {};
_statement = {
	params ["_veh"];
	if (_veh animationSourcePhase 'deploy_tent' > 0.5) then {
		[_veh] FUNC(populate);
	};
};

[
    {time>2}, 
    _statement, 
    _this
] call CBA_fnc_waitUntilAndExecute;