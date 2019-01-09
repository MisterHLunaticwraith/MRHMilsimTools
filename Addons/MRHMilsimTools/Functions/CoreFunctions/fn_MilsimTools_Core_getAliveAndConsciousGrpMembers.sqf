/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:
Example(s):
[]call MRH_fnc_MilsimTools_Core_getAliveAndConsciousGrpMembers;
*/
#include "MRH_C_Path.hpp"
params ["_grp"];
_aliveAndConsciousMembers = [];
{
	if(isPlayer _x) then {
	_isAandC = [_x]call MRH_fnc_MilsimTools_Core_isAliveAndConscious;
		if (_isAandC) then {
		_aliveAndConsciousMembers pushBackUnique _x;
		};
	};
} forEach units _grp;
_aliveAndConsciousMembers