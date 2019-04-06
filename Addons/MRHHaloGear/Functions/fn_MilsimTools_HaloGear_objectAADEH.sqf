/*
Function name:MRH_fnc_MilsimTools_HaloGear_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[someObj] spawn MRH_fnc_MilsimTools_HaloGear_objectAADEH;
*/
// /!\ this function needs to return a handle, requires scheduled environment
#include "MRH_C_Path.hpp"

params ["_object"];
	waitUntil {([_object] CFUNC(returnAltitude))>= parseNumber(_object getVariable ["MRH_HaloGear_AADOpening_alt",(["MRH_MilsimTools_HaloGear_AADDefaultOpeningAltitude"] call cba_settings_fnc_get)])};
	//systemChat "hasreached";
	waitUntil {([_object] CFUNC(returnAltitude))< parseNumber(_object getVariable ["MRH_HaloGear_AADOpening_alt",(["MRH_MilsimTools_HaloGear_AADDefaultOpeningAltitude"] call cba_settings_fnc_get)])};
	//systemChat "falling";
	[_object] CFUNC(addMultipleParachutesToObject);
	//systemChat format ["Parachute opened at %1 m",round ([_object] call MRH_fnc_MilsimTools_Core_returnAltitude)];
	waitUntil {isTouchingGround _object};
	//[_object] spawn MRH_fnc_MilsimTools_HaloGear_objectAADEH;