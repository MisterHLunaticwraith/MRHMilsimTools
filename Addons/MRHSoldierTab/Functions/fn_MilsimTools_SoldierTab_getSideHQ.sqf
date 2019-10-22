/*
Function name: MRH_fnc_MilsimTools_SoldierTab_
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
[MRH_player] call MRH_fnc_MilsimTools_SoldierTab_getSideHQ;
*/
#include "MRH_C_Path.hpp"
params ["_unit"];
	private _side = str (side _unit);
	private _hq = missionNamespace getVariable [("MRH_SoldierTab_HQModule_"+ _side),[]];
	if (_hq isEqualTo []) exitWith {["nohqWildCard","nohqWildCard",objNull]};
	_hq