/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_;
*/
#include "MRH_C_Path.hpp"
params ["_unit"];
if (is3DEN) exitWith {};





_code= {


        params ["_unit"];
		_apply = ["MRH_MilsimTools_Core_ApplyMedicPatch"] call cba_settings_fnc_get;
		if !(_apply) exitWith {};

		if !(local _unit) exitWith {};
		_isMedic = [_unit] call ace_common_fnc_isMedic;
		if !(_isMedic) exitWith {};
		[_unit, "MRH_reset"] call BIS_fnc_setUnitInsignia;

		_codeDel = {
			params ["_unit"];
			[_unit, "MRH_MedicShoulderPatch"] call BIS_fnc_setUnitInsignia;
		};
		[_codeDel,[_unit],2] call CBA_fnc_waitAndExecute;
    }; 
 
[{time>1},_code,[_unit]] call CBA_fnc_waitUntilAndExecute;