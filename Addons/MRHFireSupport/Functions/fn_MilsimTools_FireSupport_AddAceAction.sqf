/*
Function name:MRH_fnc_MilsimTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[] call MRH_fnc_MilsimTools_FireSupport_

*/
#include "MRH_C_Path.hpp"
//create action for Artillery
[] spawn {
_allowFS = ["MRH_MilsimTools_FireSupport_useFireSupport"] call cba_settings_fnc_get;
if !(_allowFS) ExitWith {Diag_Log "MRH_MilsimTools_FireSupport_Arty - Artillery support disabled in this mission"};

_condition = {true};
_forceLeaderSetting =  ["MRH_MilsimTools_FireSupport_ConditionIsFormLeader"] call cba_settings_fnc_get;
if (_forceLeaderSetting) then {_condition = {isFormationLeader player};};
_isCustomSettingSet = ["MRH_MilsimTools_FireSupport_isCustomConditionSet"] call cba_settings_fnc_get;
if (_isCustomSettingSet) then
	{
		_customSetString = ["MRH_MilsimTools_FireSupport_CustomCondition"] call cba_settings_fnc_get;
		//_finalString = _customSetString + "&& (call MRH_fnc_MilsimTools_Heli_isHeliTaxiAvailable)";
		
		_condition = compile _customSetString;
		Diag_Log format ["MRH_MilsimTools_FireSupport_Arty - User set condition: %1" ,str _condition];
	};


_action = ["MRH_FireSupport_Call","Call artillery strike","",{call MRH_fnc_MilsimTools_FireSupport_OpenArtyInterface;},_condition] call ace_interact_menu_fnc_createAction;
["CAManBase",1,['ACE_SelfActions'],_action,true] call ace_interact_menu_fnc_addActionToClass;
};

//create action for CAS
[] spawn {
_allowFS = ["MRH_MilsimTools_FireSupport_useCASSupport"] call cba_settings_fnc_get;
if !(_allowFS) ExitWith {Diag_Log "MRH_MilsimTools_FireSupport_CAS - CAS support disabled in this mission"};

_condition = {true};
_forceLeaderSetting =  ["MRH_MilsimTools_FireSupport_CAS_ConditionIsFormLeader"] call cba_settings_fnc_get;
if (_forceLeaderSetting) then {_condition = {isFormationLeader player};};
_isCustomSettingSet = ["MRH_MilsimTools_FireSupport_CAS_isCustomConditionSet"] call cba_settings_fnc_get;
if (_isCustomSettingSet) then
	{
		_customSetString = ["MRH_MilsimTools_FireSupport_CAS_CustomCondition"] call cba_settings_fnc_get;
		//_finalString = _customSetString + "&& (call MRH_fnc_MilsimTools_Heli_isHeliTaxiAvailable)";
		
		_condition = compile _customSetString;
		Diag_Log format ["MRH_MilsimTools_FireSupport_CAS - User set condition: %1" ,str _condition];
	};


_action = ["MRH_FireSupport_CAS_Call","Call Close Air Support","",{call MRH_fnc_MilsimTools_FireSupport_OpenCASInterface;},_condition] call ace_interact_menu_fnc_createAction;
["CAManBase",1,['ACE_SelfActions'],_action,true] call ace_interact_menu_fnc_addActionToClass;
};