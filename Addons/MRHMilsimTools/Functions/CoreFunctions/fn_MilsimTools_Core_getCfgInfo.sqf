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
	params ["_type",["_isBackPack",false],["_isMagazine",false]];
	if (_type isEqualTo "") exitWith {["N/A","N/A","N/A"]};
	private _cfg = "cfgWeapons";
	if (_isBackPack) then {_cfg = "cfgVehicles"};
	if (_isMagazine)then {_cfg = "cfgMagazines"};

	private _displayName = getText (configFile >>_cfg>>_type>>"displayName");
	private _picture = getText (configFile >>_cfg>>_type>>"picture");
	private _description = getText (configFile >>_cfg>>_type>>"descriptionShort");
	[_displayName,_picture,_description]