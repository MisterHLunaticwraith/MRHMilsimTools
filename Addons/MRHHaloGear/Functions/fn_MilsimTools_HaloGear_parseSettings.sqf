/*
Function name:MRH_fnc_MilsimTools_AddonName_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_AddonName_;
*/
#include "MRH_C_Path.hpp"
if (!isServer) ExitWith {};
_toMissionNameSpace =[];

// get user defined gear
_gearTypes = ["MRH_MilsimTools_HaloGear_missionConfiguredProtectiveGear"] call cba_settings_fnc_get;
_fromMission = [_gearTypes] EFUNC(FireSupport,parseMagazinesList);

_toMissionNameSpace append _fromMission;

//get addon configured gear
//vehicles
_allVehicleConfigs = "true" configClasses (configFile >> "CfgVehicles");
_allVehicleConfigNames = _allVehicleConfigs apply {configName _x};
{
	_cfgNumb = getNumber (configFile >> "CfgVehicles">> _x >>"MRH_hypoxiaRebreather");
	if (_cfgNumb == 1) then {_toMissionNameSpace pushBackUnique _x};
} forEach _allVehicleConfigNames;
//weapons
_allWeaponsConfigs = "true" configClasses (configFile >> "CfgWeapons");
_allWeaponsConfigNames = _allWeaponsConfigs apply {configName _x};
{
	_cfgNumb = getNumber (configFile >> "CfgWeapons">> _x >>"MRH_hypoxiaRebreather");
	if (_cfgNumb == 1) then {_toMissionNameSpace pushBackUnique _x};
} forEach _allWeaponsConfigNames;
//goggles
_allGoggles = [(configFile >> "cfgGlasses")]call BIS_fnc_getCfgSubClasses;
{
	_cfgNumb = getNumber (configFile >> "CfgGlasses">> _x >>"MRH_hypoxiaRebreather");
	if (_cfgNumb == 1) then {_toMissionNameSpace pushBackUnique _x};
} forEach _allGoggles;
missionNamespace setVariable ["MRH_HaloGear_protectiveGear",_toMissionNameSpace,true];