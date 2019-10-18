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
params ["_antenna","_unit"];

[
    {
		params ["_antenna","_unit"];
		(!(alive _antenna) || !(alive _unit) || ((_unit distance _antenna)>30))
	}, 
    {
		params ["_antenna","_unit"];
		_unit setVariable ['MRH_AntennaLinkedToSoldierTablet',nil,true];
		if ((alive _unit) && (_unit isEqualTo MRH_player)) then {playSound3D ["MRHMiscItems\Sounds\MRH_SAT_AntennaSignalLost.ogg",_unit]};
	}, 
    _this
] call CBA_fnc_waitUntilAndExecute;