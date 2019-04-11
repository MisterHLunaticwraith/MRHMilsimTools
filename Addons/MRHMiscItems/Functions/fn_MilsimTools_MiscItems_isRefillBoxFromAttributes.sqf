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
if (is3DEN)exitWith {};
_statement = {
	params ["_box"];
	_check= _box getVariable ["MRH_AmmoCrateParameters",[]];
	_message = format ["MRH AutoRefillBox set for %1",_box];
	if !(_check isEqualTo []) exitWith{_message = format ["MRH AutoRefillBox exited: Box %1 is already ammobox",_box];TRACE(_message);}; //exit if is already ammo crate
	[_box] call MRH_fnc_RefillBox;
	TRACE(_message);
};
[
    {time>1}, //delay to leave ammocrates initialize 1st
    _statement, 
    _this
] call CBA_fnc_waitUntilAndExecute;